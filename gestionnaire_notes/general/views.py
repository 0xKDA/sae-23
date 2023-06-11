from django.contrib.auth.decorators import login_required
from django.shortcuts import render


def accueil(request):   # Vue de gestion de l'affichage de la page d'accueil

    return render(request, 'general/accueil.html')


@login_required
def profil(request):   # Vue de gestion de l'affichage de la page de profil utilisateur

    return render(request, 'general/profil.html', {'user': request.user})
