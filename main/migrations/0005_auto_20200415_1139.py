# Generated by Django 3.0.3 on 2020-04-15 04:39

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0004_auto_20200315_2005'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='pengaduan',
            options={'permissions': [('can_add_pengaduan', 'Bisa Membuat Pengaduan'), ('can_view_pengaduan', 'Bisa Melihat Pengaduan'), ('can_delete_pengaduan', 'Bisa Menghapus Pengaduan')]},
        ),
        migrations.AlterModelOptions(
            name='tanggapan',
            options={'permissions': [('can_view_tanggapan', 'Bisa Melihat Tanggapan'), ('can_add_tanggapan', 'Bisa Membuat Tanggapan'), ('can_delete_tanggapan', 'Bisa Menghapus Tanggapan')]},
        ),
    ]
