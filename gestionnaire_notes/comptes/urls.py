from .views import VueDeConnexion
from django.urls import path
from . import views


urlpatterns = [

    path('connexion/', VueDeConnexion.as_view(template_name='comptes/connexion.html'), name='connexion'),
    path('inscription/', views.inscription, name='inscription'),
    path('deconnexion/', views.vue_de_deconnexion, name='deconnexion'),

]
