# Generated by Django 2.2.7 on 2019-11-27 01:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sistema', '0008_auto_20191121_2125'),
    ]

    operations = [
        migrations.AddField(
            model_name='projeto',
            name='email_autor_1',
            field=models.EmailField(default=None, max_length=100),
        ),
        migrations.AddField(
            model_name='projeto',
            name='email_autor_2',
            field=models.EmailField(default=None, max_length=100),
        ),
        migrations.AddField(
            model_name='projeto',
            name='email_autor_3',
            field=models.EmailField(default=None, max_length=100),
        ),
        migrations.AddField(
            model_name='projeto',
            name='email_orientador_1',
            field=models.EmailField(default=None, max_length=100),
        ),
        migrations.AddField(
            model_name='projeto',
            name='email_orientador_2',
            field=models.EmailField(default=None, max_length=100),
        ),
    ]