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


# Remplace les messages d'erreur par défaut de l'authentification
class MessagesErreurConnexionPersonnalises(AuthenticationForm):

    username = forms.CharField(label='Nom d\'utilisateur')   # Surcharge le champ 'username'
    password = forms.CharField(label='Mot de passe', widget=forms.PasswordInput)   # Surcharge le champ 'password'

    error_messages = {
        'invalid_login': (
            "Les informations que vous avez fournies sont erronées. "   # Surcharge le message d'erreur par défaut
            "Notez que les identifiants sont sensibles à la casse."   # Surcharge le message d'erreur par défaut
        ),
        'inactive': "Ce compte est inactif.",   # Surcharge le message d'erreur par défaut
    }


class VueDeConnexion(auth_views.LoginView):   # Hérite de la vue LoginView native de Django

    # Remplace le formulaire de LoginView par celui de 'MessagesErreurConnexion'
    form_class = MessagesErreurConnexionPersonnalises

    def dispatch(self, request, *args, **kwargs):   # Méthode utilisée pour pré-traiter la requête

        # Si l'utilisateur est connecté, il ne doit pas accéder à la page de connexion
        if request.user.is_authenticated:

            if request.user.is_superuser:   # Si c'est un superuser

                return redirect('admin:index')   # On le redirige vers l'interface d'administration

            else:   # Sinon, si ce n'est pas un superuser

                return redirect('profil')   # On le redirige vers sa page de profil

        else:   # Si l'utilisateur n'est pas connecté

            return super().dispatch(request, *args, **kwargs)   # Il peut accéder à la page de connexion

    def get_context_data(self, **kwargs):

        # Remplace la variable native 'form' par 'formulaire' pour le template HTML
        nom = super().get_context_data(**kwargs)
        nom['formulaire'] = nom.pop('form')
        return nom


def vue_de_deconnexion(request):   # Vue de gestion de la déconnexion des utilisateurs

    logout(request)
    return redirect('accueil')
