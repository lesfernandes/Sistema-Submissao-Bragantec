# Generated by Django 2.2.7 on 2019-12-04 00:36

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('sistema', '0023_auto_20191203_1827'),
    ]

    operations = [
        migrations.CreateModel(
            name='Avaliador',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=100, verbose_name='Nome')),
                ('link_curriculo', models.URLField(max_length=100)),
                ('titulacao', models.CharField(max_length=100)),
                ('area', models.CharField(choices=[('CHL', 'Ciências Humanas e Linguagens'), ('CNE', 'Ciências da Natureza e Exatas'), ('I', 'Informática'), ('E', 'Engenharias')], max_length=100)),
                ('user', models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Avaliador',
                'verbose_name_plural': 'Avaliadores',
            },
        ),
    ]
