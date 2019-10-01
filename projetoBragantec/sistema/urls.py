from django.urls import path
from .views import lista_autores, criar_autor, editar_autor, deletar_autor

urlpatterns = [
	path('', lista_autores, name='lista_autores'),
	path('novo', criar_autor, name='criar_autores'),
	path('editar/<int:id>', editar_autor, name='editar_autor'),
	path('deletar/<int:id>', deletar_autor, name='deletar_autor'),
]