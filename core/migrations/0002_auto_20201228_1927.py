# Generated by Django 2.2.17 on 2020-12-28 22:27

import core.models
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelManagers(
            name='user',
            managers=[
                ('objects', core.models.CustomUserManager()),
            ],
        ),
    ]