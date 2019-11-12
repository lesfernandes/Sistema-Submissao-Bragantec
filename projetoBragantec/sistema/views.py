from django.shortcuts import render
from .models import Projeto

def index(request):
	return render(request, 'index.html', {})

def dashboard(request):
	projetos = Projeto.objects.all()
	return render(request, 'dashboard.html', {'projetos':projetos})