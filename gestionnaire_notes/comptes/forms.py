from django.contrib.auth.password_validation import validate_password
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.models import User, Group
from django import forms


class MessageErreurEmailPersonnalise(forms.EmailField):

    def __init__(self, **kwargs):

        super().__init__(**kwargs)
        self.label = "Adresse e-mail"   # Renomme le champ par défaut

        # Remplace le message d'erreur par défaut via surcharge
        self.error_messages['invalid'] = "Le format de l'adresse e-mail donnée est invalide."


class FormulaireInscription(forms.ModelForm):   # Formulaire de création de comptes

    username = forms.CharField(   # Correspond au champ 'username' de la table 'auth_user' de Django
        label="Nom d'utilisateur",
        help_text="C'est l'identifiant que vous utiliserez pour vous connecter.")
    first_name = forms.CharField(label="Prénom")   # Correspond au champ 'first_name' de la table 'auth_user'
    last_name = forms.CharField(label="Nom de famille")   # Correspond au champ 'last_name' de la table 'auth_user'

    # Appelle la méthode de surcharge personnalisée sur le champ 'email' de la table 'auth_user'
    email = MessageErreurEmailPersonnalise()
    password = forms.CharField(   # Correspond au champ 'password' de la table 'auth_user'
        widget=forms.PasswordInput,   # Permet de masquer le mot de passe pendant la saisie
        label="Mot de passe",
        help_text="10 caractères minimum, incluant : une minuscule, une majuscule, un chiffre et un symbole.")
    confirmer_mdp = forms.CharField(   # Champ de confirmation du mot de passe
        widget=forms.PasswordInput,
        label=" Confirmer le mot de passe")

    class Meta:

        model = User   # Dit au formulaire de se baser sur le modèle 'User' natif de Django
        fields = ['username', 'first_name', 'last_name', 'email', 'password']

    def clean_password(self):   # Appelle une méthode de validation native de Django sur le champ 'password'

        mot_de_passe = self.cleaned_data.get('password')   # Récupère le mot de passe fourni par l'utilisateur

        if mot_de_passe:

            validate_password(mot_de_passe, self.instance)   # Utilise les validateurs de mots de passe

        return mot_de_passe

    def clean(self):   # Appelle une méthode de validation native de Django

        donnees = super().clean()   # Récupère les valeurs des champs précédents du formulaire
        mot_de_passe = donnees.get("password")   # Récupère la valeur du champ 'password'
        confirmation_mdp = donnees.get("confirmer_mdp")   # Récupère la valeur du champ 'confirmer_mdp'

        if mot_de_passe != confirmation_mdp:   # Compare les deux valeurs obtenues

            # Envoie un message d'erreur tant que les deux valeurs ne sont pas identiques
            self.add_error("confirmer_mdp", "Le mot de passe doit être identique dans les deux champs !")

    def clean_email(self):   # Appelle une méthode de vérification native de Django sur le champ 'email'

        email = self.cleaned_data.get('email')
        nom_utilisateur = self.cleaned_data.get('username')

        # Vérifie l'existence de cette combinaison de 'email' et 'username' dans la table 'auth_user'
        if email and User.objects.filter(email=email).exclude(username=nom_utilisateur).exists():

            raise forms.ValidationError(u'L\'adresse email que vous avez spécifié existe déjà.')

        return email

    def save(self, commit=True):   # Appelle une méthode native de Django pour sauvegarder les données

        utilisateur = super().save(commit=False)
        utilisateur.set_password(self.cleaned_data["password"])

        if commit:

            try:   # Essaie de récupérer le groupe 'Eleves' dans la table 'auth_group'
                ajout_groupe = Group.objects.get(name='Eleves')

            except ObjectDoesNotExist:

                raise forms.ValidationError("Le groupe 'Eleves' n'existant pas, l'inscription est avortée.")

            utilisateur.save()   # Enregistre l'utilisateur dans la table 'auth_user'
            ajout_groupe.user_set.add(utilisateur)   # Ajoute l'utilisateur au groupe 'Eleves'

        else:

            return None

        return utilisateur   # Retourne l'instance de l'utilisateur
