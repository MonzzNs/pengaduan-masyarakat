from django.shortcuts import render, redirect, HttpResponseRedirect
from django.contrib import messages  
from django.contrib.auth.decorators import login_required, permission_required
from .forms import PengaduanForm, RegisterForm, CreateStaff
from .models import Pengaduan, Tanggapan
from django.contrib import messages 
from django.contrib.auth import authenticate, login, logout
from main.models import User
from django.db.models import Count
# Create your views here.

@login_required(login_url='login')
def home_u(request):
    pengaduan = Pengaduan.objects.filter(pelapor_id=request.user.id)
    pengaduan_c = Pengaduan.objects.filter(pelapor_id=request.user.id).count()
    tanggapan = Tanggapan.objects.filter(pengaduan_id=request.user.id)
    tanggapan_c = Tanggapan.objects.filter(pengaduan_id=request.user.id).count()
    
    context = {
        'pengaduan':pengaduan,
        'pengaduan_c':pengaduan_c,
        'tanggapan':tanggapan,
        'tanggapan_c':tanggapan_c
    }
    return render(request, 'home_u.html',context)

@login_required(login_url='login')
def folks_profil(request):
    context = { 
        'header':'Masyarakat'
    }
    return render(request, 'profil_m.html', context)

@login_required(login_url='login')
def staff_profile(request):
    context = {
        'header':'Petugas'
    }
    return render(request, 'profil_s.html', context)

@login_required(login_url='login')
def admin_profil(request):
    context = {
        'header':'Admin'
    }
    return render(request, 'profil_a.html', context)

def register_page(request):
        form = RegisterForm()
        if request.method == 'POST':
            form = RegisterForm(request.POST)
            if form.is_valid():
                form.save()
                user = form.cleaned_data.get('username')
                messages.success(request,'Akun ' + user + ' Berhasil Dibuat')
                return redirect('login')
        else:
            form = RegisterForm()
        context = {
            'form':form,
            'header':'Register'
        }
        return render(request, 'register.html', context)

def login_page(request):
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password1')
         
        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            login(request, user)
            if user.is_superuser == True:
                return redirect('admin')
            elif user.is_admin == True:
                return redirect('petugas')
            else:
                return redirect('home')   
        else:
            messages.error(request, 'Username Atau Password Salah')        
    context = {}
    return render(request, 'login.html', context)

def logoutUser(request):
    logout(request)
    messages.success(request, 'Berhasil Logout')
    return redirect('login')

@login_required(login_url='login')
def pengaduan_u(request):
    form = PengaduanForm()
    context = {
            'form':form,
    }
    if request.method == 'POST':
        form = PengaduanForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Pengaduan Berhasil Dikirim, Ditunggu Balasanya Ya :)')
        else:
            messages.error(request,'Pengiriman Gagal, Mohon Cek Kembali Pengaduan Anda')
    
    return render(request, 'pengaduan_u.html', context)

@login_required(login_url='login')
@permission_required("user.can_view_staff_page", login_url='login', raise_exception=True)
def pengaduan_p(request):
    item = Pengaduan.objects.all()  
    count = Pengaduan.objects.all().count()  
    context = {
        'item':item,
        'count':count
    }
    return render(request, 'pengaduan_p.html', context)

@login_required(login_url='login')
@permission_required("user.can_view_admin_page", login_url='login', raise_exception=True)
def admin(request):
    item_p = Pengaduan.objects.all()
    count_p = Pengaduan.objects.all().count()
    item_t = Tanggapan.objects.all()
    count_t = Tanggapan.objects.all().count()
    staff = User.object.values('is_active').filter(is_staff=True).count()
    staff_l = User.object.all().filter(is_staff=True)
    folks = User.object.values('is_active').filter(is_staff=False).count()
    context = {
        'item_p':item_p,
        'count_p':count_p,
        'item_t':item_t,
        'count_t':count_t,
        'staff':staff,
        'staff_l':staff_l,
        'folks':folks,
    }
    return render(request, 'admin.html', context)

@login_required(login_url='login')
@permission_required('user.can_create_staff', login_url='login', raise_exception=True)
def create_staff(request):
    form = CreateStaff()
    if request.method == 'POST':
        form = CreateStaff(request.POST)
        if form.is_valid():
            form.save()
        else:
            messages.error(request, 'Akun Gagal Dibuat, Mohon Untuk Dicek Kembali')
    else:
        form = CreateStaff()
    context = {
        'header':'Petugas',
        'form':form,
    }
    return render(request, 'create_staff.html', context)

@login_required(login_url='login')
@permission_required("user.can_view_detail_tanggapan", login_url='login', raise_exception=True)
def detail_a_tanggapan(request):
    item = Tanggapan.objects.all()
    context = {
        'item':item,
        'header':'Tanggapan'
    }
    return render(request, 'detail_a.html', context)

@login_required(login_url='login')
@permission_required("user.can_view_detail_pengaduan", login_url='login', raise_exception=True)
def detail_a_pengaduan(request):
    item = Pengaduan.objects.all()
    context = {
        'item':item,
        'header':'Pengaduan'
    }
    return render(request, 'detail_a.html', context)

@login_required(login_url='login')
@permission_required("user.can_view_detail_folks", login_url='login', )
def detail_a_folks(request):
    item = User.object.all().filter(is_staff=False)
    context = {
        'item':item,
        'header':'Masyarakat'
    }
    return render(request, 'detail_a.html', context)

@login_required(login_url='login')
@permission_required("user.can_view_detail_staff", login_url='login', raise_exception=True)
def detail_a_staff(request):
    item = User.object.all().filter(is_staff=True)
    context = {
        'item':item,
        'header':'Petugas'
    }
    return render(request, 'detail_a.html', context)