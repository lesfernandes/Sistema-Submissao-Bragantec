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
from cruds_adminlte.urls import crud_for_model, crud_for_app
from django.apps import apps
from sistema.forms import AlteracoesForm
from cruds_adminlte.crud import CRUDMixin
from sistema.models import Avaliador, Diretor

class MixinList(CRUDMixin):
    def get_context_data(self, *args, **kwargs):
        context = super(Mixin, self).get_context_data(*args, **kwargs)
        context['avaliadores'] = Avaliador.objects.all()
        context['diretores'] = Diretor.objects.all()
        return context


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('sistema.urls')),
]

urlpatterns += crud_for_model(
	apps.get_model('sistema', 'Projeto'),
	views=['delete', 'detail', 'update', 'list'], 
	login_required=True, update_form=AlteracoesForm, mixin=MixinList)

urlpatterns += crud_for_model(
    apps.get_model('sistema', 'Avaliador'),
    views=['list'], login_required=True)

urlpatterns += crud_for_model(
    apps.get_model('sistema', 'Diretor'),
    views=['list'], login_required=True)





