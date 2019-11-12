from django.db import models
from django.contrib.auth.models import AbstractUser
from django.conf import settings

class Autor(AbstractUser):
    email = models.EmailField('E-mail', unique=True)
    name = models.CharField('Nome', max_length=100)
    tipos = [('E', 'Estudante'), ('O', 'Orientador')]
    tipo = models.CharField(choices=tipos, max_length=100, blank=True)
    idade = models.IntegerField('Idade', blank=True, default=None)
    curso = models.CharField('Curso', max_length=100,blank=True)
    serie = models.CharField('Série', max_length=100,blank=True)
    instituicao = models.CharField('Instituição', max_length=100)

    REQUIRED_FIELDS = ['name', 'tipo', 'instituicao', 'username']
    USERNAME_FIELD = 'email'

    def __str__(self):
        return self.email

    def get_name(self):
        return self.name

    class Meta:
        verbose_name = "Autor"
        verbose_name_plural = "Autores"

class Projeto(models.Model):
    resumo = models.CharField(max_length=200)
    email = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    areas = [('CHL', 'Ciências Humanas e Linguagens'), ('CNE', 'Ciências da Natureza e Exatas'), ('I', 'Informática'), ('E', 'Engenharias')]
    area = models.CharField(choices=areas, max_length=100)
    palavras_chave = models.CharField(max_length=30)
    plano_pesquisa = models.FileField(upload_to='uploads/')
    link_video = models.CharField(max_length=100)

    class Meta:
        verbose_name = "Projeto"
        verbose_name_plural = "Projetos"
