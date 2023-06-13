from django.contrib.auth.models import Group, User
from general.models import Etudiants, Enseignants
from django.db.models.signals import m2m_changed
from django.dispatch import receiver


# Le décorateur connecte la fonction au signal ManyToMany (m2m_changed) pour le modèle Group natif de Django
@receiver(m2m_changed, sender=User.groups.through)
def creation_profil_utilisateur(sender, instance, action, model, pk_set, **kwargs):

    if action == "post_add":   # Si l'action ayant déclenché le signal correspond à un ajout

        group = Group.objects.get(pk=list(pk_set)[0])

        if group.name == 'Eleves':   # Vérifie si le nom du groupe est 'Eleves'

            # Met à jour ou créé un enregistrement dans le modèle 'Etudiants' s'il n'existe pas déjà
            Etudiants.objects.update_or_create(
                utilisateur=instance,
                defaults={
                    "prenom": instance.first_name,
                    "nom": instance.last_name,
                    "email": instance.email
                }
            )

        elif group.name == 'Professeurs':   # Vérifie si le nom du groupe est 'Professeurs'

            # Récupère ou créé un enregistrement dans le modèle 'Enseignants' s'il n'existe pas déjà
            Enseignants.objects.update_or_create(
                utilisateur=instance,
                defaults={
                    "prenom": instance.first_name,
                    "nom": instance.last_name
                }
            )
