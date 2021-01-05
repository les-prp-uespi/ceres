from django.contrib import admin
from django.urls import path, include


urlpatterns = [
    path('admin/', admin.site.urls),
    path('auth/', include('rest_auth.urls')),
    path('auth/registration/', include('rest_auth.registration.urls')),
    path('api/materiais/', include('material.urls'), name = "materiais"),
    path('api/reservas/', include('reservation.urls'), name = "reserva")
   
]