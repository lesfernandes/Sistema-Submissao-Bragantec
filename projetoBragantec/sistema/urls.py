from django.urls import path, include
import sistema.views
from django.contrib.auth import views

urlpatterns = [
	path('', sistema.views.index, name='index'),
	path('login/', views.LoginView.as_view(), name='login'),
	path('logout/', views.LogoutView.as_view(), name='logout'),
	path('dashboard/', sistema.views.dashboard, name='dashboard'),
	path('registro/', sistema.views.register, name='register'),
	path('submeter-projeto/', sistema.views.submit_project, name='submit_project'),
	path('confirmar/', sistema.views.confirm, name='confirm'),
]