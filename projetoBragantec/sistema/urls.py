from django.urls import path
from .views import login, lista_autores, criar_autor, editar_autor, deletar_autor, index

urlpatterns = [
	path('', index, name='index'),
	path('lista', lista_autores, name='lista_autores'),
	path('novo', criar_autor, name='criar_autor'),
	path('editar/<int:id>', editar_autor, name='editar_autor'),
	path('deletar/<int:id>', deletar_autor, name='deletar_autor'),
	path('login', login, name='login'),
]