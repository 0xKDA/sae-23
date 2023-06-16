from django.urls import path
from . import views


urlpatterns = [

    path('', views.accueil, name='accueil'),
    path('profil/', views.profil, name='profil'),
    path('profil/notes/', views.VueElevesNotes.as_view(), name='etudiants_notes'),
    path('gestion/', views.gestion, name='gestion'),
    path('gestion/ajout/', views.ajout, name='ajout'),
    path('gestion/ajout/ue/', views.ajout_ue, name='ajout_ue'),
    path('gestion/ajout/ressource/', views.ajout_ressource, name='ajout_ressource'),
    path('gestion/ajout/note/', views.ajout_note, name='ajout_note'),
    path('gestion/ue/', views.gestion_ue, name='gestion_ue'),
    path('gestion/ressources/', views.gestion_ressources, name='gestion_ressources'),
    path('gestion/modification/ue/<str:code_ue>/', views.modification_ue, name='modification_ue'),
    path('gestion/modification/ressource/<str:code_ressource>/', views.modification_ressource, name='modification_ressource'),
    path('gestion/suppression/ue/<str:code_ue>/', views.suppression_ue, name='suppression_ue'),
    path('gestion/suppression/ressource/<str:code_ressource>/', views.suppression_ressource, name='suppression_ressource'),
    path('gestion/notes/', views.gestion_notes, name='gestion_notes'),
    path('gestion/modification/note/<int:pk>/', views.ModificationNote.as_view(), name='modification_note'),
    path('gestion/suppression/note/<int:pk>/', views.SuppressionNote.as_view(), name='suppression_note'),

]
