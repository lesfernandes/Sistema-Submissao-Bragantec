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
	path('aceitar-submissao/<int:pk>', sistema.views.accept_submission, name='accept_submission'),
	path('rejeitar-submissao/<int:pk>', sistema.views.reject_submission, name='reject_submission'),
	path('gerar-pdf/', sistema.views.generate_pdf, name='generate_pdf'),
	path('baixar-pdf/<int:pk>', sistema.views.download_pdf, name='download_pdf'),
]