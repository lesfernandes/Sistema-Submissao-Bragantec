from django.shortcuts import render, redirect
from .models import Autor
from .forms import RegistroAutorForm

def lista_autores(request):
	autores = Autor.objects.all()
	return render(request, 'sistema/autores.html', 
		{'autores': autores})

def criar_autor(request):
	template_name = 'sistema/autores-form.html'
	form = RegistroAutorForm(request.POST or None)

	if form.is_valid():
		form.save()
		return redirect('lista_autores')

	return render(request, template_name, {'form':form})

def editar_autor(request, id):
	autor = Autor.objects.get(id=id)
	form = RegistroAutorForm(request.POST or None, instance=autor)

	if form.is_valid():
		form.save()
		return redirect('lista_autores')

	return render(request, 'sistema/autores-form.html', {'form':form, 'autor':autor})

def deletar_autor(request, id):
	autor = Autor.objects.get(id=id)

	if request.method == 'POST':
		autor.delete()
		return redirect('lista_autores')

	return render(request, 'sistema/confirmar-delete-autor.html', {'autor': autor})

def index(request):
	return render(request, 'sistema/index.html', {})

def login(request):
	return render(request, 'sistema/login.html', {})