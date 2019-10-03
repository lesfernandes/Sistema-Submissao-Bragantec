from django import forms 
from .models import Autor
from django.contrib.auth.forms import UserCreationForm, UserChangeForm

class RegistroAutorForm(forms.ModelForm):
	"""senha1 = forms.CharField(
		label='Senha', widget=forms.PasswordInput)
	senha2 = forms.CharField(
		label='Confirmação de Senha', 
		widget=forms.PasswordInput)

	def verifica_senha(self):
		senha1 = self.cleaned_data.get('senha1')
		senha2 = self.cleaned_data.get('senha2')
		if senha1 and senha2 and senha2 != senha2:
			raise forms.ValidationError('A confimação não está correta!')
			return senha2

	def save(self, commit=True):
		user = super(AutorForm, self).save(commit=False)
		user.set_password(self.cleaned_data['senha1'])
		if commit:
			user.save()
		return user"""
	
	class Meta:
		model = Autor
		fields = "__all__"
		