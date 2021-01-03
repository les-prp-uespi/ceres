from django.urls import path

from users import views

app_name = 'user'

urlpatterns = [
    path('criar/', views.UserView.as_view(), name = "create"),
    path('token/', views.CreateTokenView.as_view(), name= "token"),
    path('me/', views.ManagerUserView.as_view(), name = "me")
]