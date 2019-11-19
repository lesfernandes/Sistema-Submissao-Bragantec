from django.db import models
from django.contrib.auth.models import (AbstractBaseUser, PermissionsMixin,
    UserManager)
from django.conf import settings

class User(AbstractBaseUser, PermissionsMixin):

    username = models.CharField(
        'Nome de Usuário', max_length=30, unique=True
    )
    email = models.EmailField('E-mail', unique=True)
    name = models.CharField('Nome', max_length=100, blank=True)
    is_active = models.BooleanField('Está ativo?', blank=True, default=True)
    is_staff = models.BooleanField('É da equipe?', blank=True, default=False)
    date_joined = models.DateTimeField('Data de Entrada', auto_now_add=True)

    objects = UserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['']

    def __str__(self):
        return self.name or self.username

    def get_short_name(self):
        return self.username

    def get_full_name(self):
        return str(self)

    class Meta:
        verbose_name = 'Usuário'
        verbose_name_plural = 'Usuários'

class Autor(models.Model):
    email = models.EmailField('E-mail', unique=True)
    nome = models.CharField('Nome', max_length=100, blank=True)
    tipos = [('E', 'Estudante'), ('O', 'Orientador')]
    tipo = models.CharField(choices=tipos, max_length=100, blank=True)
    idade = models.IntegerField('Idade', blank=True, default=None)
    curso = models.CharField('Curso', max_length=100,blank=True)
    serie = models.CharField('Série', max_length=100,blank=True)
    instituicao = models.CharField('Instituição', max_length=100, blank=True)

    def __str__(self):
        return self.email

    def get_name(self):
        return self.name

    class Meta:
        verbose_name = "Autor"
        verbose_name_plural = "Autores"

class Projeto(models.Model):
    titulo = models.CharField(max_length=100, default=None)
    resumo = models.CharField(max_length=200)
    areas = [('CHL', 'Ciências Humanas e Linguagens'), ('CNE', 'Ciências da Natureza e Exatas'), ('I', 'Informática'), ('E', 'Engenharias')]
    area = models.CharField(choices=areas, max_length=100)
    palavras_chave = models.CharField(max_length=30)
    introducao = models.CharField(max_length=500, default=None)
    objetivos = models.CharField(max_length=500, default=None)
    material = models.CharField(max_length=500, default=None)
    metodologia = models.CharField(max_length=500, default=None)
    resultados = models.CharField(max_length=500, default=None)
    referencias_bibliograficas  = models.CharField(max_length=500, default=None)
    plano_pesquisa = models.FileField(upload_to='uploads/', blank=True)
    link_video = models.CharField(max_length=100)

    class Meta:
        verbose_name = "Projeto"
        verbose_name_plural = "Projetos"
