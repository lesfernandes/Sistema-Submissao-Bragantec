from django.shortcuts import render, redirect
from .models import Projeto
from django.contrib.auth import authenticate, login
from .forms import RegisterForm, SubmitForm, AutorForm

def index(request):
	return render(request, 'index.html', {})

def dashboard(request):
	projetos = Projeto.objects.all()
	return render(request, 'dashboard.html', {'projetos':projetos})

def register(request):
	if request.method == 'POST':
		form = AutorForm(request.POST)
		if form.is_valid():
			user = form.save()
			return redirect('submit_project')
	else:
		form = AutorForm()
	return render(request, 'registration/register.html', {'form': form})

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