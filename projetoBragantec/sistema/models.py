from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class Autor(models.Model):
	escolhas = [(0,'Orientador'), (1,'Estudante')]
	tipo = models.CharField(choices=escolhas, max_length=10, default=0)
	email = models.EmailField('E-mail', unique=True, default=None)
	nome = models.CharField('Nome', max_length=100, default=None)
	idade = models.IntegerField('Idade', default=None)
	curso = models.CharField('Curso', max_length=100, default=None)
	serie = models.CharField('Série', max_length=100, default=None)
	instituicao = models.CharField('Instituição', max_length=100, default=None)
	
	def __str__(self):
		return self.email

	class Meta:
		db_table = "autor"
		verbose_name = "Autor"
		verbose_name_plural = "Autores"
			
class Projeto(models.Model):
	resumo = models.CharField(max_length=200)
	email = models.ForeignKey(Autor, on_delete=models.CASCADE)
	areas = [(0, 'Ciências Humanas e Linguagens'), 
			(1, 'Ciências da Natureza e Exatas'), 
			(2, 'Informática'),
			(3, 'Engenharias')]
	area = models.CharField(choices=areas, max_length=32)
	palavras_chaves = models.CharField(max_length=100)
	plano_de_pesquisa = models.FileField(upload_to='uploads/')
	link_video = models.CharField(max_length=150)

	class Meta:
		verbose_name = "Projeto"
		verbose_name_plural = "Projetos"
		db_table = "projeto"