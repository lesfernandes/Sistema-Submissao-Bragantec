from django.shortcuts import render, redirect
from sistema.forms import AutorForm
from sistema.models import Autor

# Create your views here.
def registro(request):
	if request.method == "POST":
		form = AutorForm(request.POST)
		if form.is_valid():
			try:
				form.save()
				return redirect('/')
			except:
				pass
	else:
		form = AutorForm()

	return render(request, 'sistema/index.html', {'form':form})

