# Generated by Django 2.2.7 on 2019-11-13 00:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sistema', '0014_auto_20191112_2118'),
    ]

    operations = [
        migrations.AlterField(
            model_name='projeto',
            name='plano_pesquisa',
            field=models.FileField(blank=True, upload_to='uploads/'),
        ),
    ]
