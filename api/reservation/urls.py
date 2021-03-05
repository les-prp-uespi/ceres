from django.urls import path

from reservation import views

app_name = 'reservation'

urlpatterns = [
   path('', views.ReservationView.as_view(), name = "reservas"),
   path('<int:pk>/', views.UpdateReservationView.as_view(), name = "atualizar"),
]