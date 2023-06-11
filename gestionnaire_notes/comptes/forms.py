from django.contrib.auth.password_validation import validate_password
from django.contrib.auth.models import User
from .models import Etudiant
from django import forms


class FormulaireInscription(forms.ModelForm):   # Formulaire de création de comptes

    username = forms.CharField(label="Nom d'utilisateur")   # Renomme le champ 'username' par défaut
    email = forms.EmailField(label="Adresse e-mail")   # Renomme le champ 'email' par défaut

    password = forms.CharField(
        widget=forms.PasswordInput,   # Permet de masquer la saisie du champ mot de passe
        label="Mot de passe",   # Renomme le champ 'password' par défaut
        help_text="10 caractères minimum, incluant : une minuscule, une majuscule, un chiffre et un symbole.")

    class Meta:

        model = Etudiant
        fields = ['username', 'email', 'password']

    def clean_password(self):   # Appelle une méthode de validation native de Django sur le champ 'password'

        password = self.cleaned_data.get('password')

        if password:

            validate_password(password, self.instance)

        return password

    def clean_email(self):   # Appelle une méthode de vérification native de Django sur le champ 'email'

        email = self.cleaned_data.get('email')
        username = self.cleaned_data.get('username')

        if email and User.objects.filter(email=email).exclude(username=username).exists():

            raise forms.ValidationError(u'L\'adresse email spécifiée existe déjà.')

        return email

    def save(self, commit=True):   # Appelle une méthode native de Django pour sauvegarder les données

        utilisateur = super().save(commit=False)
        utilisateur.set_password(self.cleaned_data["password"])

        if commit:

            utilisateur.save()

        return utilisateur
