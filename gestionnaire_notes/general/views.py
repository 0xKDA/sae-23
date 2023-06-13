from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect


def accueil(request):   # Vue de gestion de l'affichage de la page d'accueil

    return render(request, 'general/accueil.html')


@login_required
def profil(request):   # Vue de gestion de l'affichage de la page de profil utilisateur

    if request.user.is_superuser:   # Si l'utilisateur est un superuser, il ne doit pas accéder au profil

        return redirect('admin:index')   # On le redirige vers l'interface d'administration

    return render(request, 'general/profil.html', {'user': request.user})
