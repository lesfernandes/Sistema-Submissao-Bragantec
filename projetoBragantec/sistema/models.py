from django.db import models

# Create your models here.
class Autor(models.Model):
	email = models.EmailField('E-mail', unique=True)
	nome = models.CharField('Nome', max_length=100)
	idade = models.IntegerField('Idade')
	curso = models.CharField('Curso', max_length=100)
	serie = models.CharField('Série', max_length=100)
	instituicao = models.CharField('Instituição', max_length=100)

	class Meta:
		db_table = "autor"
			