from django.apps import AppConfig


class ComptesConfig(AppConfig):

    default_auto_field = 'django.db.models.BigAutoField'
    name = 'comptes'

    def ready(self):   # Permet d'initialiser les signaux du fichier 'signals.py' au lancement du serveur

        import comptes.signals  # noqa
