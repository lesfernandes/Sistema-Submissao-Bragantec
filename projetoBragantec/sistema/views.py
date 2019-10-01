from django.shortcuts import render, redirect
from .models import Autor
from .forms import AutorForm

def lista_autores(request):
	autores = Autor.objects.all()
	return render(request, 'sistema/autores.html', 
		{'autores': autores})

def criar_autor(request):
	form = AutorForm(request.POST or None)

	if form.is_valid():
		form.save()
		return redirect('lista_autores')

	return render(request, 'sistema/autores-form.html', {'form':form})

def editar_autor(request, id):
	autor = Autor.objects.get(id=id)
	form = AutorForm(request.POST or None, instance=autor)

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