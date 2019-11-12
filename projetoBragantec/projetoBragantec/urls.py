"""projetoBragantec URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from cruds_adminlte.urls import crud_for_app
from sistema.forms import RegisterForm

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('sistema.urls')),
]

custom_forms = { 'add_autor': RegisterForm}
urlpatterns += crud_for_app('sistema',  views=['update', 'list'], login_required=True)
urlpatterns += crud_for_app('sistema', modelforms=custom_forms, views=['create'], login_required=False)