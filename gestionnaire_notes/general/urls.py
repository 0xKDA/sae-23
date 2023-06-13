from django.urls import path
from . import views


urlpatterns = [

    path('', views.accueil, name='accueil'),
    path('profil/', views.profil, name='profil'),
    path('gestion/', views.gestion, name='gestion'),
    path('gestion/ajout/', views.ajout, name='ajout'),
    path('gestion/ajout/ue/', views.ajout_ue, name='ajout_ue'),
    path('gestion/ajout/ressource/', views.ajout_ressource, name='ajout_ressource'),
    path('gestion/ue/', views.gestion_ue, name='gestion_ue'),
    path('gestion/ressources/', views.gestion_ressources, name='gestion_ressources'),
    path('gestion/modification/ue/<str:code_ue>/', views.modification_ue, name='modification_ue'),
    path('gestion/modification/ressource/<str:code_ressource>/', views.modification_ressource, name='modification_ressource'),
    path('gestion/suppression/ue/<str:code_ue>/', views.suppression_ue, name='suppression_ue'),
    path('gestion/suppression/ressource/<str:code_ressource>/', views.suppression_ressource, name='suppression_ressource'),

]
