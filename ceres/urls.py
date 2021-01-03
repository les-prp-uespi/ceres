from django.contrib import admin
from django.urls import path, include
from rest_framework.authtoken import views



urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/usuarios/', include('users.urls'), name = "users"),
    path('api/materiais/', include('material.urls'), name = "materiais"),
    path('api/reservas/', include('reservation.urls'), name = "reserva")
   
]