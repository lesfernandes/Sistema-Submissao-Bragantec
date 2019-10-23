from django.db import models
from django.contrib.auth.models import AbstractUser
from django.conf import settings

class Autor(AbstractUser):

    username = models.CharField('username', max_length=150, unique=True)
    email = models.EmailField('E-mail', unique=True)
    name = models.CharField('Nome', max_length=100)
    tipo = models.CharField(max_length=100)
    idade = models.IntegerField('Idade')
    curso = models.CharField('Curso', max_length=100,blank=True)
    serie = models.CharField('Série', max_length=100,blank=True)
    instituicao = models.CharField('Instituição', max_length=100)

    REQUIRED_FIELDS = ['name', 'tipo', 'instituicao']
    USERNAME_FIELD = 'email'

    def __str__(self):
        return self.email

    class Meta:
        verbose_name = "Autor"
        verbose_name_plural = "Autores"

class Projeto(models.Model):
    resumo = models.CharField(max_length=200)
    email = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    area = models.CharField(max_length=10)
    palavras_chave = models.CharField(max_length=30)
    plano_pesquisa = models.FileField(upload_to='uploads/')
    link_video = models.CharField(max_length=100)

    class Meta:
        verbose_name = "Projeto"
        verbose_name_plural = "Projetos"