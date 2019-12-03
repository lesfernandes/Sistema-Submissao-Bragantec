from django.shortcuts import render, redirect, get_object_or_404
from .models import Projeto, Autor, User, Orientador
from django.contrib.auth import authenticate, login, get_user_model
from .forms import SubmitForm, AutorForm, RegisterForm, OrientadorForm
import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from cruds_adminlte.crud import CRUDView
import io
from django.http import FileResponse
from reportlab.pdfgen import canvas

User = get_user_model()

def index(request):
	return render(request, 'index.html', {})

@login_required
def dashboard(request):
	projetos = Projeto.objects.all()
	return render(request, 'dashboard.html', {'projetos':projetos})

def register_user(request):
	if request.method == 'POST':
		form = RegisterForm(request.POST)
		if form.is_valid():
			user = form.save()
			user = authenticate(username=user.username, 
				password=form.cleaned_data['password1']
				)
			login(request, user)
			return redirect('dashboard')
	else:
		form = RegisterForm()
	return render(request, 'register_user.html', {'form': form})

@login_required
@csrf_exempt
def register_autor(request):
	autores = Autor.objects.all()
	projetos = Projeto.objects.all()
	response_data = {}



	if request.method == 'POST':
		data = request.POST

		email = data['email']
		nome = data['nome']
		dt_nasc = data['dt_nasc']
		curso = data['curso']
		serie = data['serie']
		instituicao = data['instituicao']

		response_data['email'] = email
		response_data['nome'] = nome
		response_data['dt_nasc'] = dt_nasc
		response_data['curso'] = curso
		response_data['serie'] = serie
		response_data['instituicao'] = instituicao

		Autor.objects.create(email=email, 
			nome=nome, 
			dt_nasc=dt_nasc, curso=curso, 
			serie=serie, instituicao=instituicao, user_id=request.user.id)

		return JsonResponse(response_data)

	form = AutorForm()
	return render(request, 'registration/register.html', {'form': form, 'autores': autores})

@login_required
def submit_project(request):
	user_id = request.user.id

	orientadores = Orientador.objects.filter(user_id=user_id).values_list('email')
	autores = Autor.objects.filter(user_id = user_id).values_list('email')
	orientadores = list(orientadores)
	autores = list(autores)

	if request.method == 'POST':
		form = SubmitForm(request.POST)
		if form.is_valid():
			projeto = form.save(commit=False)
			
			if len(autores) == 1:
				projeto.email_autor_1 = autores[0][0]
				projeto.email_autor_2 = ''
				projeto.email_autor_3 = ''
			elif len(autores) == 2:
				projeto.email_autor_1 = autores[0][0]
				projeto.email_autor_2 = autores[1][0]
				projeto.email_autor_3 = ''
			elif len(autores) == 3:
				projeto.email_autor_1 = autores[0][0]
				projeto.email_autor_2 = autores[1][0]
				projeto.email_autor_3 = autores[2][0]

			if len(orientadores) == 1:
				projeto.email_orientador_1 = orientadores[0][0]
				projeto.email_orientador_2 = ''
			elif len(orientadores) == 2:
				projeto.email_orientador_1 = orientadores[0][0]
				projeto.email_orientador_2 = orientadores[1][0]

			projeto.user_id = user_id

			projeto.save()
			return redirect('confirm')
	else:
		form = SubmitForm()
	return render(request, 'registration/submit.html', {'form': form})

@login_required
def confirm(request):
	user_id = request.user.id
	orientadores = Orientador.objects.filter(user_id=user_id)
	autores = Autor.objects.filter(user_id = user_id)
	projeto = Projeto.objects.filter(user_id=user_id)
	return render(request, 'registration/confirm.html', 
		{'autores': autores,
		'projeto': projeto,
		'orientadores': orientadores})

@login_required
def register_orientador(request):
	response_data = {}

	if request.method == 'POST':
		data = request.POST

		email = data['email']
		nome = data['nome']
		instituicao = data['instituicao']

		response_data['email'] = email
		response_data['nome'] = nome
		response_data['instituicao'] = instituicao

		Orientador.objects.create(
			email=email, 
			nome=nome, 
			instituicao=instituicao, 
			user_id=request.user.id)

		return JsonResponse(response_data)
	form = OrientadorForm()
	return render(request, 'registration/register_orientador.html', {'form': form})

@login_required
def accept_submission(request, pk):
	projeto = get_object_or_404(Projeto.objects.all(), pk=pk)
	if request.method == 'POST':
		data = request.POST
		projeto.status = data['status']
		projeto.pk = pk
		projeto.save()
		return redirect('sistema_projeto_list')
	return render(request, 'admin_actions/accept_submission.html', {'projeto':projeto})

@login_required
def reject_submission(request, pk):
	projeto = get_object_or_404(Projeto.objects.all(), pk=pk)
	if request.method == 'POST':
		data = request.POST
		projeto.status = data['status']
		projeto.pk = pk
		projeto.save()
		return redirect('sistema_projeto_list')
	return render(request, 'admin_actions/reject_submission.html', {'projeto':projeto})

def generate_pdf(request):
	if request.method == 'POST':
		data = request.POST
		buffer1 = io.BytesIO()
		p = canvas.Canvas(buffer1)
		x = 720
		for campo in data:
			if campo != 'csrfmiddlewaretoken':
				p.drawString(100, x, '{}: {}'.format(campo, data[campo]))
				x-=20
			else:
				pass

		p.showPage()

		p.save()

		buffer1.seek(0)

		return FileResponse(buffer1, as_attachment=True, filename='projeto.pdf')
	"""p.drawString(247, 720, "Título: {}".format(projeto.titulo))
	p.drawString(100, 700, "Resumo: {}".format(projeto.resumo))
	p.drawString(100, 680, "Área: {}".format(projeto.area))
	p.drawString(100, 660, "Palavras-Chave: {}".format(projeto.palavras_chave))
	p.drawString(100, 640, "Introdução: {}".format(projeto.introducao))
	p.drawString(100, 620,"Objetivos: {}".format(projeto.objetivos))
	p.drawString(100, 600, "Material: {}".format(projeto.material))
	p.drawString(100, 580, "Metodologia: {}".format(projeto.metodologia))
	p.drawString(100, 560, "Resultados: {}".format(projeto.resultados))
	p.drawString(100, 540, "Referências Bibliográficas: {}".format(projeto.referencias_bibliograficas))
	p.drawString(100, 520, "Link Vídeo: {}".format(projeto.link_video))"""

def download_pdf(request, pk):
	projeto = get_object_or_404(Projeto.objects.all(), pk=pk)

	return render(request, 'admin_actions/download_pdf.html', {'projeto': projeto})
