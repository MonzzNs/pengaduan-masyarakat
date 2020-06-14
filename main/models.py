from django.db import models
from django.core.exceptions import ValidationError
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin, Group, Permission

class CustomUserManager(BaseUserManager):
    def create_user(self, username, nik, nama, telp, password=None):
        if not username:
            raise ValueError('User Must Be Have Username')
        user = self.model(
            username = username,
            nik = nik,
            nama = nama,
            telp = telp,
        )
        user.username = username    
        user.set_password(password)
        user.nik = nik
        user.nama = nama
        user.telp = telp
        user.save(using=self._db)
        return user
    
    def create_superuser(self, username, nik, nama, telp, password):
        user = self.create_user(
            username = username,
            password=password,
            nik = nik,
            nama = nama,
            telp = telp,
        )
        user.is_admin = True
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user
    
class User(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(max_length=25, unique=True)
    nik = models.CharField(max_length=16)
    nama = models.CharField(max_length=40)
    telp = models.CharField( max_length=13)
    last_login = models.DateField(verbose_name='last login', auto_now_add=True)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    
    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['nama', 'nik', 'telp']
    
    object = CustomUserManager()
    
    class Meta:
        permissions=[
            ('can_view_admin_page', 'Bisa Melihat Admin Page'),
            ('can_view_masyarakat_page', 'Bisa Melihat Melihat Masyarakat Page'),
            ('can_view_staff_page', 'Bisa Melihat Staff Page'),
            ('can_create_pengaduan', 'Bisa Mengadu'),
            ('can_create_tanggapan', 'Bisa Membuat Tanggapan '),
            ('can_create_staff', 'Bisa Membuat Pegawai Baru'),
            ('can_view_detail_tanggapan', 'Bisa Melihat Detail Tanggapan'),
            ('can_view_detail_folks', 'Bisa Melihat Detail Folks Page'),
            ('can_view_detail_staff', 'Bisa Melihat Detail Staff Page'),
        ]
    
    def __str__(self):
        return self.username

    def has_perm(self, perm, obj=None):
        return self.is_admin
    
    def has_module_perms(self, app_label):
        return True
    
class Pengaduan(models.Model):
    tanggal = models.DateField(auto_now_add=True)
    pelapor = models.ForeignKey(User, on_delete=models.CASCADE)
    laporan = models.TextField(max_length=1000)
    foto = models.ImageField(upload_to='media')
    choices = (
        ('0','0'),
        ('Proses','Proses'),
        ('Selesai','Selesai')
    )
    status = models.CharField(max_length=50, choices=choices, default='Proses')
    
    def __str__(self):
        return '{}/{}'.format(self.laporan,self.pelapor)
    
class Tanggapan(models.Model):
    pengaduan = models.ForeignKey(Pengaduan, on_delete=models.CASCADE)
    tanggal = models.DateField(auto_now_add=True)
    tanggapan = models.TextField(max_length=1000)
    petugas = models.ForeignKey(User, on_delete=models.DO_NOTHING)
    
    def __str__(self):
        return '{}/{}'.format(self.pengaduan, self.petugas)