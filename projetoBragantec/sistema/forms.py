from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model
from .models import Projeto, Autor, Orientador
from cruds_adminlte import DatePickerWidget

User = get_user_model()

class RegisterForm(forms.ModelForm):

    password1 = forms.CharField(label='Senha', widget=forms.PasswordInput)
    password2 = forms.CharField(
        label='Confirmação de Senha', widget=forms.PasswordInput
    )

    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError('A confirmação não está correta')
        return password2

    def save(self, commit=True):
        user = super(RegisterForm, self).save(commit=False)
        user.set_password(self.cleaned_data['password1'])
        if commit:
            user.save()
        return user

    class Meta:
        model = User
        fields = ['username', 'email']

class AutorForm(forms.ModelForm):

    class Meta:
        model = Autor
        exclude = ['user']

class OrientadorForm(forms.ModelForm):
    class Meta:
        model = Orientador
        exclude = ['user']


class SubmitForm(forms.ModelForm):
    resumo = forms.CharField(widget=forms.Textarea)
    introducao = forms.CharField(widget=forms.Textarea)
    objetivos = forms.CharField(widget=forms.Textarea)
    material = forms.CharField(widget=forms.Textarea)
    metodologia = forms.CharField(widget=forms.Textarea)
    resultados = forms.CharField(widget=forms.Textarea)
    referencias_bibliograficas = forms.CharField(widget=forms.Textarea)
    class Meta:
        model = Projeto
        exclude = ['email_autor_1', 'email_autor_2', 
        'email_autor_3', 'email_orientador_1', 'email_orientador_2', 'user', 'alteracoes']