from django.contrib import admin
from general.models import *

# Ajoute les modèles de la base de données à l'interface d'administration de Django (nécessite un superuser)
admin.site.register(Etudiants)
admin.site.register(Enseignants)
admin.site.register(Enseignements)
admin.site.register(Examens)
admin.site.register(Notes)
admin.site.register(Curriculum)
admin.site.register(Ressources)
admin.site.register(Ue)
