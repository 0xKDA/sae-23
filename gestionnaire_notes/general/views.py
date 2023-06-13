from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from comptes.decorators import professeur_requis
from .forms import *


def accueil(request):   # Vue de gestion de l'affichage de la page d'accueil

    return render(request, 'general/accueil.html')


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
def profil(request):   # Vue de gestion de l'affichage de la page de profil utilisateur

    if request.user.is_superuser:   # Si l'utilisateur est un superuser, il ne doit pas accéder au profil

        return redirect('admin:index')   # On le redirige vers l'interface d'administration

    utilisateur = {'user': request.user}

    if request.user.groups.filter(name='Professeurs').exists():

        utilisateur['est_professeur'] = True

    return render(request, 'general/profil.html', utilisateur)


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
@professeur_requis('Professeurs')   # Vue autorisée seulement aux utilisateurs du groupe Professeurs
def ajout(request):   # Vue de gestion de l'affichage de la page d'ajout globale

    if request.user.is_superuser:   # Si l'utilisateur est un superuser, il ne doit pas accéder au profil

        return redirect('admin:index')   # On le redirige vers l'interface d'administration

    utilisateur = {'user': request.user}

    if request.user.groups.filter(name='Professeurs').exists():

        utilisateur['est_professeur'] = True

    return render(request, 'gestion/ajout.html', utilisateur)


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
@professeur_requis('Professeurs')   # Vue autorisée seulement aux utilisateurs du groupe Professeurs
def gestion(request):   # Vue de gestion de l'affichage de la page de gestion globale

    if request.user.is_superuser:   # Si l'utilisateur est un superuser, il ne doit pas accéder au profil

        return redirect('admin:index')   # On le redirige vers l'interface d'administration

    utilisateur = {'user': request.user}

    if request.user.groups.filter(name='Professeurs').exists():

        utilisateur['est_professeur'] = True

    return render(request, 'gestion/gestion.html', utilisateur)


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
@professeur_requis('Professeurs')   # Vue autorisée seulement aux utilisateurs du groupe Professeurs
def gestion_ue(request):   # Vue de gestion de l'affichage de la page de gestion des UE

    ue = Ue.objects.all()
    return render(request, 'gestion/ue/gestion_ue.html', {'ue': ue})


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
@professeur_requis('Professeurs')   # Vue autorisée seulement aux utilisateurs du groupe Professeurs
def ajout_ue(request):   # Vue de gestion de l'affichage de la page d'ajout d'UE

    if request.method == 'POST':

        formulaire = FormulaireUe(request.POST)

        if formulaire.is_valid():

            formulaire.save()
            return redirect('gestion_ue')

    else:

        formulaire = FormulaireUe()

    return render(request, 'gestion/ue/ajout_ue.html', {'formulaire': formulaire})


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
@professeur_requis('Professeurs')   # Vue autorisée seulement aux utilisateurs du groupe Professeurs
def modification_ue(request, code_ue):   # Vue de gestion de l'affichage de la page de modification d'UE

    ue = get_object_or_404(Ue, pk=code_ue)

    if request.method == 'POST':

        formulaire = FormulaireUe(request.POST, instance=ue)

        if formulaire.is_valid():

            formulaire.save()
            return redirect('gestion_ue')

    else:

        formulaire = FormulaireUe(instance=ue)

    return render(request, 'gestion/ue/modification_ue.html', {'formulaire': formulaire})


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
@professeur_requis('Professeurs')   # Vue autorisée seulement aux utilisateurs du groupe Professeurs
def suppression_ue(request, code_ue):   # Vue de gestion de l'affichage de la page de suppression d'UE

    ue = get_object_or_404(Ue, pk=code_ue)

    if request.method == 'POST':

        ue.delete()
        return redirect('gestion_ue')

    return render(request, 'gestion/ue/suppression_ue.html', {'ue': ue})


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
@professeur_requis('Professeurs')   # Vue autorisée seulement aux utilisateurs du groupe Professeurs
def gestion_ressources(request):   # Vue de gestion de l'affichage de la page de gestion des ressources

    ressources = Ressources.objects.all()
    return render(request, 'gestion/ressources/gestion_ressources.html', {'ressources': ressources})


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
@professeur_requis('Professeurs')   # Vue autorisée seulement aux utilisateurs du groupe Professeurs
def ajout_ressource(request):   # Vue de gestion de l'affichage de la page d'ajout de ressource

    if request.method == 'POST':

        formulaire = FormulaireRessources(request.POST)

        if formulaire.is_valid():

            formulaire.save()
            return redirect('gestion_ressources')

    else:

        formulaire = FormulaireRessources()

    return render(request, 'gestion/ressources/ajout_ressource.html', {'formulaire': formulaire})


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
@professeur_requis('Professeurs')   # Vue autorisée seulement aux utilisateurs du groupe Professeurs
def modification_ressource(request, code_ressource):   # Vue de gestion de l'affichage de la page de modification de ressource

    ressource = get_object_or_404(Ressources, pk=code_ressource)

    if request.method == 'POST':

        formulaire = FormulaireRessources(request.POST, instance=ressource)

        if formulaire.is_valid():

            formulaire.save()
            return redirect('gestion_ressources')

    else:

        formulaire = FormulaireRessources(instance=ressource)

    return render(request, 'gestion/ressources/modification_ressource.html', {'formulaire': formulaire})


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
@professeur_requis('Professeurs')   # Vue autorisée seulement aux utilisateurs du groupe Professeurs
def suppression_ressource(request, code_ressource):   # Vue de gestion de l'affichage de la page de suppression de ressource

    ressource = get_object_or_404(Ressources, pk=code_ressource)

    if request.method == 'POST':

        ressource.delete()
        return redirect('gestion_ressources')

    return render(request, 'gestion/ressources/suppression_ressource.html', {'ressource': ressource})
