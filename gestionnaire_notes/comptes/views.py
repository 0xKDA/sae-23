from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import views as auth_views
from django.shortcuts import render, redirect
from .forms import FormulaireInscription
from django.contrib.auth import logout
from django import forms


def inscription(request):   # Vue de gestion de l'affichage du formulaire d'inscription

    if request.method == 'POST':

        formulaire = FormulaireInscription(request.POST)

        if formulaire.is_valid():

            formulaire.save()
            return redirect('connexion')

    else:

        formulaire = FormulaireInscription()

    return render(request, 'comptes/inscription.html', {'formulaire': formulaire})


class MessagesErreurConnexion(AuthenticationForm):   # Remplace les messages d'erreur par défaut de l'authentification

    username = forms.CharField(label='Nom d\'utilisateur')   # Surcharge le champ 'username'
    password = forms.CharField(label='Mot de passe', widget=forms.PasswordInput)   # Surcharge le champ 'password'

    error_messages = {
        'invalid_login': (
            "Les informations que vous avez fournies sont erronées. "   # Surcharge le message d'erreur par défaut
            "Notez que les identifiants sont sensibles à la casse."   # Surcharge le message d'erreur par défaut
        ),
        'inactive': ("Ce compte est inactif."),   # Surcharge le message d'erreur par défaut
    }


class VueDeConnexion(auth_views.LoginView):   # Hérite de la vue LoginView native de Django

    form_class = MessagesErreurConnexion   # Remplace le formulaire de LoginView par celui de 'MessagesErreurConnexion'

    def get_context_data(self, **kwargs):

        nom = super().get_context_data(**kwargs)
        nom['formulaire'] = nom.pop('form')  # Remplace la variable native 'form' par 'formulaire' pour le fichier .html
        return nom


def vue_de_deconnexion(request):   # Vue de gestion de la déconnexion des utilisateurs

    logout(request)
    return redirect('accueil')
