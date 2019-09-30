from django import forms 
from sistema.models import Autor

class AutorForm(forms.ModelForm):
	class Meta:
		model = Autor
		fields = "__all__"
			