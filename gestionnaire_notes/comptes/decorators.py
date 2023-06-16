from django.contrib.auth.decorators import user_passes_test
from django.core.exceptions import PermissionDenied


# Décorateur personnalisé vérifiant l'appartenance d'un utilisateur au groupe 'Professeurs'
def professeur_requis(professeurs):   # Le décorateur qu'on utilisera

    def verification_groupe(user):   # La fonction de vérification d'appartenance

        if user.groups.filter(name=professeurs).exists():

            return True

        raise PermissionDenied

    return user_passes_test(verification_groupe)
