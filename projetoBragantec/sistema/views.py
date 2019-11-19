from django.shortcuts import render, redirect
from .models import Projeto, Autor
from django.contrib.auth import authenticate, login
from .forms import SubmitForm, AutorForm
import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt


def index(request):
	return render(request, 'index.html', {})

def dashboard(request):
	projetos = Projeto.objects.all()
	return render(request, 'dashboard.html', {'projetos':projetos})


@csrf_exempt
def register(request):
	autores = Autor.objects.all()
	response_data = {}

	if request.method == 'POST':
		data = request.POST

		email = data['email']
		nome = data['nome']
		tipo = data['tipo']
		idade = data['idade']
		curso = data['curso']
		serie = data['serie']
		instituicao = data['instituicao']

		"""email = request.POST.get('email')
		nome = request.POST.get('nome')
		tipo = request.POST.get('tipo')
		idade = request.POST.get('idade')
		curso = request.POST.get('curso')
		serie = request.POST.get('serie')
		instituicao = request.POST.get('instituicao')"""

		response_data['email'] = email
		response_data['nome'] = nome
		response_data['tipo'] = tipo
		response_data['idade'] = idade
		response_data['curso'] = curso
		response_data['serie'] = serie
		response_data['instituicao'] = instituicao

		Autor.objects.create(email=email, 
			nome=nome, tipo=tipo, 
			idade=idade, curso=curso, 
			serie=serie, instituicao=instituicao)

		return JsonResponse(response_data)

	form = AutorForm()
	return render(request, 'registration/register.html', {'form': form, 'autores': autores})

def submit_project(request):
	if request.method == 'POST':
		form = SubmitForm(request.POST)
		if form.is_valid():
			form.save()
			return redirect('confirm')
	else:
		form = SubmitForm()
	return render(request, 'registration/submit.html', {'form': form})

def confirm(request):
	user = request.user
	return render(request, 'registration/confirm.html', {'user': user})

    