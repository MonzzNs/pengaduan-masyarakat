from django.contrib import admin 
from django.contrib.auth.admin import UserAdmin
from .models import Pengaduan ,Tanggapan  
from django.contrib.auth import get_user_model
# Register your models here.

User = get_user_model()

class AdminDisplay(UserAdmin):
    fields = ('username','nik','nama','telp','is_admin','is_staff', 'is_superuser')
    list_display = ('username','nik','nama','telp','is_admin','is_staff', 'is_superuser')
    search_fields = ('username','nik')
    readonly_fields = ['last_login']
    
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()

admin.site.register(User,AdminDisplay)    

class PengaduanDisplay(admin.ModelAdmin):
    ordering = ('tanggal',)
    
    fields = ('tanggal', 'laporan', 'foto', 'status', 'pelapor')
    list_display = ('tanggal', 'laporan', 'foto', 'status', 'pelapor')
    search_fields = ('laporan','pelapor__nama')
    readonly_fields = ['tanggal']
    
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()

admin.site.register(Pengaduan, PengaduanDisplay)

class TanggapanDisplay(admin.ModelAdmin):
    ordering = ('tanggal',)
    
    fields = ('pengaduan', 'tanggal', 'tanggapan', 'petugas', )
    list_display = ('pengaduan', 'tanggal', 'tanggapan', 'petugas', )
    search_fields = ('pengaduan__laporan','petugas')
    readonly_fields = ['tanggal']
    
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()

    
admin.site.register(Tanggapan, TanggapanDisplay)
