from django.core.exceptions import ValidationError

# Importation des validateurs de mots de passe natifs de Django afin de remplacer leurs messages d'erreur par défaut
from django.contrib.auth.password_validation import (
    MinimumLengthValidator,
    UserAttributeSimilarityValidator,
    CommonPasswordValidator,
    NumericPasswordValidator,
)

from difflib import SequenceMatcher
import re


class VerificateurMotDePasse:   # Validateur de mots de passe personnalisé pour compléter ceux natifs de Django
    def validate(self, mot_de_passe, user=None):

        if not re.findall('[A-Z]', mot_de_passe):

            raise ValidationError("Le mot de passe doit contenir au moins une lettre majuscule.")

        if not re.findall('[a-z]', mot_de_passe):

            raise ValidationError("Le mot de passe doit contenir au moins une lettre minuscule.")

        if not re.findall('[0-9]', mot_de_passe):

            raise ValidationError("Le mot de passe doit contenir au moins un chiffre.")

        if not re.findall('[^A-Za-z0-9]', mot_de_passe):

            raise ValidationError("Le mot de passe doit contenir au moins un caractère spécial.")

    def get_help_text(self):

        return "Votre mot de passe doit contenir au moins une lettre majuscule, une lettre minuscule, un chiffre, et un caractère spécial."


class ValidateurLongueurMinimalePersonnalise(MinimumLengthValidator):

    # Surcharge des messages d'erreur par défaut du validateur natif de longueur minimale
    def validate(self, password, user=None):

        if len(password) < self.min_length:

            raise ValidationError(
                "Votre mot de passe doit contenir au moins %(min_length)d caractères.",
                code='password_too_short',
                params={'min_length': self.min_length},
            )


class ValidateurSimilitudePersonnalise(UserAttributeSimilarityValidator):

    # Surcharge des messages d'erreur par défaut du validateur natif de similitude
    def validate(self, password, user=None):

        if not user:

            return

        for attribute_name in self.user_attributes:

            value = getattr(user, attribute_name, None)

            if value and SequenceMatcher(a=password.lower(), b=value.lower()).quick_ratio() > self.max_similarity:

                raise ValidationError(
                    "Le mot de passe est trop similaire à l'attribut %(verbose_name)s.",
                    code='password_too_similar',
                    params={'verbose_name': attribute_name},
                )


class ValidateurBanalitePersonnalise(CommonPasswordValidator):

    # Surcharge des messages d'erreur par défaut du validateur natif de banalité
    def validate(self, password, user=None):

        if password.lower().strip() in self.passwords:

            raise ValidationError(
                "Votre mot de passe est trop commun, un peu d'originalité pardi !",
                code='password_too_common',
            )


class ValidateurNumeriquePersonnalise(NumericPasswordValidator):

    # Surcharge des messages d'erreur par défaut du validateur numérique natif
    def validate(self, password, user=None):

        if password.isdigit():

            raise ValidationError(
                "Votre mot de passe ne peut pas être composé exclusivement de chiffres.",
                code='password_entirely_numeric',
            )
