# Generated by Django 3.0.3 on 2020-04-22 10:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0011_update_proxy_permissions'),
        ('main', '0008_auto_20200415_1915'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='pengaduan',
            options={},
        ),
        migrations.AlterModelOptions(
            name='tanggapan',
            options={},
        ),
        migrations.AlterModelOptions(
            name='user',
            options={'permissions': [('can_view_admin_page', 'Bisa Melihat Admin Page'), ('can_view_staff_page', 'Bisa Melihat Staff Page'), ('can_create_pengaduan', 'Bisa Mengadu'), ('can_create_tanggapan', 'Bisa Membuat Tanggapan ')]},
        ),
        migrations.AlterField(
            model_name='user',
            name='groups',
            field=models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups'),
        ),
        migrations.AlterField(
            model_name='user',
            name='user_permissions',
            field=models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions'),
        ),
    ]
