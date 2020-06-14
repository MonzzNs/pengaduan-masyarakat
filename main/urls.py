from django.urls import path
from . import views
from django.conf import settings
from pengaduan_masyarakat.settings import DEBUG, STATICFILES_DIRS, STATIC_URL, MEDIA_ROOT, MEDIA_URL
from django.conf.urls.static import static
urlpatterns = [
    path('', views.register_page, name='register'),
    path('login',views.login_page, name='login'),
    path('logout', views.logoutUser, name='logout'),
    path('beranda', views.home_u, name="home"),
    path('pengaduan', views.pengaduan_u, name='pengaduan'),
    path('staff-pengaduan', views.pengaduan_p, name='petugas'),
    path('buat-staff', views.create_staff, name='c_staff'),
    path('profil-masyarakat', views.folks_profil, name='profil_m'),
    path('profil-admin', views.admin_profil, name='profil_a'),
    path('profil-petugas', views.staff_profile, name='profil_s'),
    path('admin-page',views.admin, name="admin"),
    path('detail-pengaduan', views.detail_a_pengaduan, name="admin_p"),
    path('detail-tanggapan', views.detail_a_tanggapan, name="admin_t"),
    path('detail-masyarakat', views.detail_a_folks, name="admin_m"),
    path('detail-petugas', views.detail_a_staff, name="admin_s"),
]

if DEBUG:
    urlpatterns += static(STATIC_URL, document_root=STATICFILES_DIRS)
    urlpatterns += static(MEDIA_URL, document_root=MEDIA_ROOT)
