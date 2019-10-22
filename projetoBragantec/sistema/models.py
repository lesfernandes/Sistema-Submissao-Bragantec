from django.db import models
from django.contrib.auth.models import AbstractUser

class Autor(AbstractUser):

    username = models.CharField('username', max_length=150, unique=True)
    email = models.EmailField('E-mail', unique=True)
    name = models.CharField('Nome', max_length=100)
    tipo = models.CharField(max_length=100)
    idade = models.IntegerField('Idade')
    curso = models.CharField('Curso', max_length=100,blank=True)
    serie = models.CharField('Série', max_length=100,blank=True)
    instituicao = models.CharField('Instituição', max_length=100)

    REQUIRED_FIELDS = ['email']
    USERNAME_FIELD = 'username'

    def __str__(self):
        return self.name

    def get_full_name(self):
        return str(self)

    class Meta:
        verbose_name = "Autor"
        verbose_name_plural = "Autores"

        