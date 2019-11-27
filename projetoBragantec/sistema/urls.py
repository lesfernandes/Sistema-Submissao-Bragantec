from django.urls import path, include
import sistema.views
from django.contrib.auth import views

urlpatterns = [
	path('', sistema.views.index, name='index'),
	path('login/', views.LoginView.as_view(redirect_authenticated_user=True), name='login'),
	path('logout/', views.LogoutView.as_view(), name='logout'),
	path('dashboard/', sistema.views.dashboard, name='dashboard'),
	path('registro-autor/', sistema.views.register_autor, name='register_autor'),
	path('submeter-projeto/', sistema.views.submit_project, name='submit_project'),
	path('confirmar/', sistema.views.confirm, name='confirm'),
	path('registro-usuario/', sistema.views.register_user, name='register_user'),
	path('registro-orientador/', sistema.views.register_orientador, name='register_orientador'),
]