from django.urls import path, include
import sistema.views
from django.contrib.auth import views

urlpatterns = [
	path('', sistema.views.index, name='index'),
	path('login/', views.LoginView.as_view(), name='login'),
	path('logout/', views.LogoutView.as_view(), name='logout'),
	path('dashboard/', sistema.views.dashboard, name='dashboard'),
]