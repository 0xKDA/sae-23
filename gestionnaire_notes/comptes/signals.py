from general.models import Etudiants, Enseignants
from django.db.models.signals import m2m_changed
from django.contrib.auth.models import Group
from django.dispatch import receiver


# Le décorateur connecte la fonction au signal ManyToMany (m2m_changed) pour le modèle Group natif de Django
@receiver(m2m_changed, sender=Group.user_set.through)
def creation_profil_utilisateur(sender, instance, action, model, pk_set, **kwargs):

    if action == 'post_add':   # Si l'action ayant déclenché le signal correspond à un ajout

        for id_utilisateur in pk_set:   # Itère à travers les IDs des utilisateurs ajoutés au groupe

            utilisateur = model.objects.get(pk=id_utilisateur)   # Récupère l'instance correspondant à l'ID utilisateur

            if instance.name == 'Eleves':   # Vérifie si le nom du groupe est 'Eleves'

                # Récupère ou créé un enregistrement dans le modèle 'Etudiants' s'il n'existe pas déjà
                etudiant, existe = Etudiants.objects.get_or_create(utilisateur=utilisateur)

                if existe:   # Remplit, via l'instance actuelle, les champs correspondants du modèle 'Etudiants'

                    etudiant.nom = utilisateur.last_name
                    etudiant.prenom = utilisateur.first_name
                    etudiant.email = utilisateur.email
                    etudiant.save()

            elif instance.name == 'Professeurs':   # Vérifie si le nom du groupe est 'Professeurs'

                # Récupère ou créé un enregistrement dans le modèle 'Enseignants' s'il n'existe pas déjà
                enseignant, existe = Enseignants.objects.get_or_create(utilisateur=utilisateur)

                if existe:   # Remplit, via l'instance actuelle, les champs correspondants du modèle 'Enseignants'

                    enseignant.nom = utilisateur.last_name
                    enseignant.prenom = utilisateur.first_name
                    enseignant.email = utilisateur.email
                    enseignant.save()
