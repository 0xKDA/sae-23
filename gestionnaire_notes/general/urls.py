from django.urls import path
from . import views


urlpatterns = [

    path('', views.accueil, name='accueil'),
    path('profil/', views.profil, name='profil'),

]
