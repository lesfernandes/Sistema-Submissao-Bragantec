# Generated by Django 2.2.7 on 2019-12-05 01:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sistema', '0025_auto_20191204_1855'),
    ]

    operations = [
        migrations.CreateModel(
            name='Evento',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titulo', models.CharField(max_length=100, verbose_name='Título')),
            ],
            options={
                'verbose_name': 'Evento',
                'verbose_name_plural': 'Eventos',
            },
        ),
    ]
