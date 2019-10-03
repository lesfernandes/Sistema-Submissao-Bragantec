from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class Autor(models.Model):
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
			