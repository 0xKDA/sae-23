from django.contrib.auth.models import Group, User
from general.models import Etudiants, Enseignants
from django.db.models.signals import m2m_changed
from django.dispatch import receiver


@receiver(m2m_changed, sender=User.groups.through)
def creation_profil_utilisateur(sender, instance, action, pk_set, **kwargs):

    if action == "post_add":   # Si l'action ayant déclenché le signal correspond à un ajout

        if kwargs.get('reverse'):
            
            instance_groupe = instance
            instance_utilisateur = kwargs['model'].objects.get(pk=list(pk_set)[0])

        else:

            instance_utilisateur = instance
            instance_groupe = Group.objects.get(pk=list(pk_set)[0])

        if instance_groupe.name == 'Eleves':   # Vérifie si le nom du groupe est 'Eleves'

            Etudiants.objects.update_or_create(
                utilisateur=instance_utilisateur,
                defaults={
                    "prenom": instance_utilisateur.first_name,
                    "nom": instance_utilisateur.last_name,
                    "email": instance_utilisateur.email
                }
            )

        elif instance_groupe.name == 'Professeurs':   # Vérifie si le nom du groupe est 'Professeurs'

            Enseignants.objects.update_or_create(
                utilisateur=instance_utilisateur,
                defaults={
                    "prenom": instance_utilisateur.first_name,
                    "nom": instance_utilisateur.last_name
                }
            )
