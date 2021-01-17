from django.urls import path

from reservation import views

app_name = 'reservation'

urlpatterns = [
   path('', views.ReservationView.as_view(), name = "reserva-create"),
   path('reservas', views.ReservationListView.as_view(), name = "reservas-list"),
   path('teste', views.ReservationGenericView.as_view(), name = "teste")
]