from django.shortcuts import render, redirect
from .models import Projeto, Autor, User, Orientador
from django.contrib.auth import authenticate, login, get_user_model
from .forms import SubmitForm, AutorForm, RegisterForm, OrientadorForm
import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required

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