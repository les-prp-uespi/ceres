from django.urls import path

from material import views

app_name = 'material'

urlpatterns = [
   path('', views.MaterialView.as_view(), name = "material")
]