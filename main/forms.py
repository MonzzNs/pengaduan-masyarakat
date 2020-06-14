import re
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.utils.translation import ugettext as _
from .models import Pengaduan
from main.models import User
# ------------------------------------

class RegisterForm(UserCreationForm):
    username = forms.CharField(max_length=25, help_text='Min 5 Karakter, Maks 25 Karakter', widget=forms.TextInput(attrs={'class':'input100 form-control', 'id':"username",'placeholder':"Minimal 5 Karakter"}))
    nik = forms.CharField(max_length=16, help_text='16 Digits', widget=forms.TextInput(attrs={'class':'input100 form-control', 'id':"nik",'placeholder':"Nomor Nik . . ."}))
    nama = forms.CharField(max_length=35, help_text='Maks 35 Karakter', widget=forms.TextInput(attrs={'class':'input100 form-control', 'id':"nama",'placeholder':"Minimal 5 Karakter"}))
    telp = forms.CharField(max_length=13, help_text='Di isi Oleh Nomor, Maks 13', widget=forms.TextInput(attrs={'class':'input100 form-control', 'id':"telp",'placeholder':"Ex:08xxxxxxxxxxx"}))
    password1 = forms.CharField(max_length=20, widget=forms.PasswordInput(attrs={'class':'input100 form-control', 'id':"password1",'placeholder':"Password . . ."}))
    password2 = forms.CharField(max_length=20, widget=forms.PasswordInput(attrs={'class':'input100 form-control', 'id':"password2",'placeholder':"Konfirmasi Password . . ."}))
    #Register Validators
    def clean(self):
        super(RegisterForm, self).clean()
        username = self.cleaned_data.get('username')
        nama = self.cleaned_data.get('nama')
        nik = self.cleaned_data.get('nik')
        telp = self.cleaned_data.get('telp')
        p1 = self.cleaned_data.get('password1')
        p2 = self.cleaned_data.get('password2')        
        
        if not re.findall(r'\d+', telp):
            self._errors['Nomor Telp Error : '] = self.error_class(['Harus Diisi Dengan Angka'])
        
        if not re.findall(r'\d+', nik):
            self._errors['NIK Error :'] = self.error_class(['Harus Diisi Dengan Angka'])
        
        if len(nama) < 3:
            self._errors['Nama Error : '] = self.error_class(['Nama Terlalu Pendek'])
        
        if len(username) < 5:
            self._errors['Username Error :'] = self.error_class(['Username terlalu Pendek, Minimal 5 Karakter'])
        
        if len(p1) < 5:
            self._errors['Password Error :'] = self.error_class(['Password Terlalu Pendek, Tidak Boleh Kurang Dari 5 Karakter'])
        
        if p2 != p1:
            self._errors[''] = self.error_class(['Password Tidak Sama'])
            
        return self.cleaned_data
    #End
    class Meta:
        model = User
        fields = ('username', 'nik', 'nama', 'telp')

class PengaduanForm(forms.ModelForm):
    pelapor = forms.CharField(required=True, widget=forms.TextInput(attrs={'class':"input100 username"}))
    laporan = forms.CharField(required=True, widget=forms.Textarea(attrs={'class':"input100 laporan", 'placeholder':"Isi Laporan"}))
    foto = forms.FileField(required=True, widget=forms.FileInput(attrs={'class':"input100 foto"}))
    class Meta:
        model = Pengaduan
        fields = ('pelapor', 'laporan', 'foto', )
        
class CreateStaff(forms.ModelForm):
    username = forms.CharField(max_length=25, min_length=3,help_text='Min 5 Karakter, Maks 25 Karakter', widget=forms.TextInput(attrs={'class':"input100 form-control username",'placeholer':"Username . . ."}))
    nik = forms.CharField(max_length=16,min_length=3 ,  help_text='16 Digits', widget=forms.TextInput(attrs={'class':"input100 form-control nik",'placeholder':"Nomor NIk . . ."}))
    nama = forms.CharField(max_length=35, min_length=3, help_text='Maks 35 Karakter', widget=forms.TextInput(attrs={'class':"input100 form-control nama", 'placeholder':"Nama . . ."}))
    telp = forms.CharField(max_length=13, min_length=3,help_text='Di isi Oleh Nomor, Maks 13', widget=forms.TextInput(attrs={'class':"input100 telp"}))
    password1 = forms.CharField(max_length=20, min_length=3, widget=forms.PasswordInput(attrs={'class':"input100 password1"}))
    password2 = forms.CharField(max_length=20, min_length=3, widget=forms.PasswordInput(attrs={'class':"input100 password2"}))
    is_staff = forms.BooleanField(required=True, widget=forms.CheckboxInput(attrs={'class':"is_staff"}))
    
    class Meta:
        model = User
        fields = ('username', 'nik', 'nama', 'telp', 'is_staff')