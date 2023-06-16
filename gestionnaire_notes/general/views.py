from django.shortcuts import render, redirect, get_object_or_404, reverse
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.exceptions import PermissionDenied
from comptes.decorators import professeur_requis
from django.views.generic.edit import UpdateView
from django.views.generic.edit import DeleteView
from django.views import View
from .models import *
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

    if request.user.groups.filter(name='Eleves').exists():

        utilisateur['est_eleve'] = True

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


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
@professeur_requis('Professeurs')   # Vue autorisée seulement aux utilisateurs du groupe Professeurs
def ajout_note(request):

    formulaire = FormulaireNotes(request.POST or None)

    if formulaire.is_valid():

        id_etudiant = formulaire.cleaned_data['id_etudiant']
        code_ue = formulaire.cleaned_data['code_ue']
        code_ressource = formulaire.cleaned_data['code_ressource']
        note = formulaire.cleaned_data['note']
        appreciation = formulaire.cleaned_data['appreciation']
        titre = formulaire.cleaned_data['titre']
        date = formulaire.cleaned_data['date']
        coefficient = formulaire.cleaned_data['coefficient']

        # Récupère ou créé un nouvel enregistrement dans le modèle Examens
        examen, _ = Examens.objects.get_or_create(titre=titre, date=date, coefficient=coefficient,
                                                  code_ressource=code_ressource)

        # Récupère ou créé un nouvel enregistrement dans le modèle Notes
        Notes.objects.create(id_etudiant=id_etudiant, id_examen=examen, note=note, appreciation=appreciation)

        if not Curriculum.objects.filter(code_ressource=code_ressource, code_ue=code_ue).exists():

            Curriculum.objects.create(code_ressource=code_ressource, code_ue=code_ue)

        enseignant = get_object_or_404(Enseignants, utilisateur=request.user)

        if not Enseignements.objects.filter(id_enseignant=enseignant,
                                            code_ressource=code_ressource).exists():

            Enseignements.objects.create(id_enseignant=enseignant, code_ressource=code_ressource)

        return redirect('gestion_notes')

    return render(request, 'gestion/notes/ajout_note.html', {'formulaire': formulaire})


@login_required   # Vue autorisée seulement aux utilisateurs authentifiés
@professeur_requis('Professeurs')   # Vue autorisée seulement aux utilisateurs du groupe Professeurs
def gestion_notes(request):   # Vue de gestion de l'affichage de la page de gestion des ressources

    notes = Notes.objects.select_related('id_etudiant', 'id_examen', 'id_examen__code_ressource')

    for note in notes:

        note.id_examen.code_ressource.curriculum_related = Curriculum.objects.get(
            code_ressource=note.id_examen.code_ressource)

    return render(request, 'gestion/notes/gestion_notes.html', {'notes': notes})


class ModificationNote(LoginRequiredMixin, UpdateView):

    model = Notes
    form_class = FormulaireNotes
    template_name = 'gestion/notes/modification_note.html'

    def dispatch(self, request, *args, **kwargs):

        if not request.user.groups.filter(name='Professeurs').exists():

            raise PermissionDenied

        return super().dispatch(request, *args, **kwargs)

    def get_success_url(self):

        return reverse('gestion_notes')


class SuppressionNote(LoginRequiredMixin, DeleteView):

    model = Notes
    template_name = 'gestion/notes/suppression_note.html'

    def dispatch(self, request, *args, **kwargs):

        if not request.user.groups.filter(name='Professeurs').exists():

            raise PermissionDenied

        return super().dispatch(request, *args, **kwargs)

    def delete(self, request, *args, **kwargs):

        note = self.get_object()
        examen = note.id_examen

        if Notes.objects.filter(id_examen=examen).count() == 1:

            examen.delete()

        response = super().delete(request, *args, **kwargs)
        return response

    def get_success_url(self):

        return reverse('gestion_notes')


class VueElevesNotes(LoginRequiredMixin, View):

    def dispatch(self, request, *args, **kwargs):

        if not request.user.groups.filter(name='Eleves').exists():

            raise PermissionDenied

        return super().dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        etudiant = Etudiants.objects.get(utilisateur=request.user)
        notes = Notes.objects.filter(id_etudiant=etudiant.id_etudiant)
        examens = Examens.objects.filter(notes__in=notes)
        ressources = Ressources.objects.filter(examens__in=examens)
        ue = Ue.objects.filter(curriculum__code_ressource__in=ressources)
        context = {
            'etudiant': etudiant,
            'notes': notes,
            'examens': examens,
            'ressources': ressources,
            'ue': ue,
        }
        return render(request, 'general/etudiants_notes.html', context)
