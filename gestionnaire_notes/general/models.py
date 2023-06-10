from django.db import models


class Etudiants(models.Model):
    id_etudiant = models.AutoField(primary_key=True)   # Définit la clé primaire utilisée par Django
    nom = models.CharField(max_length=50)
    prenom = models.CharField(max_length=50)
    groupe = models.CharField(max_length=10)
    photo = models.TextField(blank=True, null=True)
    email = models.CharField(max_length=255)

    class Meta:
        managed = False   # Interdit à Django d'altérer la structure de la table
        db_table = 'etudiants'   # Associe le modèle à la table 'etudiants' de la base de données


class Examens(models.Model):
    id_examen = models.AutoField(primary_key=True)   # Définit la clé primaire utilisée par Django
    titre = models.CharField(max_length=50)
    date = models.DateField()
    coefficient = models.IntegerField()
    code_ressource = models.ForeignKey(   # Clé étrangère
        'Ressources',   # Pointe vers le modèle 'Ressources' associé à la table 'ressources'
        on_delete=models.CASCADE,   # Établit la suppression en cascade lors de la disparition d'une association
        db_column='code_ressource',   # Pointe vers le champ 'code_ressource' de la table 'ressources'
        related_name='examens',   # Permet l'utilisation de requêtes inversées vers cette table
    )

    class Meta:
        managed = False   # Interdit à Django d'altérer la structure de la table
        db_table = 'examens'   # Associe le modèle à la table 'examens' de la base de données


class Notes(models.Model):
    id_note = models.AutoField(primary_key=True)   # Définit la clé primaire utilisée par Django
    id_etudiant = models.ForeignKey(   # Clé étrangère
        Etudiants,   # Pointe vers le modèle 'Etudiants' associé à la table 'etudiants'
        on_delete=models.CASCADE,   # Établit la suppression en cascade lors de la disparition d'une association
        db_column='id_etudiant',   # Pointe vers le champ 'id_etudiant' de la table 'etudiants'
        related_name='notes',   # Permet l'utilisation de requêtes inversées vers cette table
    )
    id_examen = models.ForeignKey(   # Clé étrangère
        Examens,   # Pointe vers le modèle 'Examens' associé à la table 'examens'
        on_delete=models.CASCADE,   # Établit la suppression en cascade lors de la disparition d'une association
        db_column='id_examen',   # Pointe vers le champ 'id_examen' de la table 'examens'
        related_name='notes',   # Permet l'utilisation de requêtes inversées vers cette table
    )
    note = models.DecimalField(max_digits=4, decimal_places=2)
    appreciation = models.TextField(blank=True, null=True)

    class Meta:
        managed = False   # Interdit à Django d'altérer la structure de la table
        db_table = 'notes'   # Associe le modèle à la table 'notes' de la base de données

        # Garantit, dans la table, l'unicité de chaque combinaison de 'id_etudiant' + 'id_examen'
        unique_together = (('id_etudiant', 'id_examen'),)


class Ue(models.Model):
    code_ue = models.CharField(primary_key=True, max_length=10)   # Définit la clé primaire utilisée par Django
    nom = models.CharField(max_length=50)
    semestre = models.IntegerField()
    credits_ects = models.IntegerField()

    class Meta:
        managed = False   # Interdit à Django d'altérer la structure de la table
        db_table = 'ue'   # Associe le modèle à la table 'ue' de la base de données


class Ressources(models.Model):
    code_ressource = models.CharField(primary_key=True, max_length=10)   # Définit la clé primaire utilisée par Django
    nom = models.CharField(max_length=50)
    descriptif = models.TextField(blank=True, null=True)
    coefficient = models.IntegerField()

    class Meta:
        managed = False   # Interdit à Django d'altérer la structure de la table
        db_table = 'ressources'   # Associe le modèle à la table 'ressources' de la base de données


class Enseignants(models.Model):
    id_enseignant = models.AutoField(primary_key=True)   # Définit la clé primaire utilisée par Django
    nom = models.CharField(max_length=50)
    prenom = models.CharField(max_length=50)

    class Meta:
        managed = False   # Interdit à Django d'altérer la structure de la table
        db_table = 'enseignants'   # Associe le modèle à la table 'enseignants' de la base de données


class Curriculum(models.Model):
    id_curriculum = models.AutoField(primary_key=True)   # Définit la clé primaire utilisée par Django
    code_ressource = models.ForeignKey(   # Clé étrangère
        Ressources,   # Pointe vers le modèle 'Ressources' associé à la table 'ressources'
        on_delete=models.CASCADE,   # Établit la suppression en cascade lors de la disparition d'une association
        db_column='code_ressource',   # Pointe vers le champ 'code_ressource' de la table 'ressources'
        related_name='curriculum',   # Permet l'utilisation de requêtes inversées vers cette table
    )
    code_ue = models.ForeignKey(   # Clé étrangère
        Ue,   # Pointe vers le modèle 'Ue' associé à la table 'ue'
        on_delete=models.CASCADE,   # Établit la suppression en cascade lors de la disparition d'une association
        db_column='code_ue',   # Pointe vers le champ 'code_ue' de la table 'ue'
        related_name='curriculum',   # Permet l'utilisation de requêtes inversées vers cette table
    )

    class Meta:
        managed = False   # Interdit à Django d'altérer la structure de la table
        db_table = 'curriculum'   # Associe le modèle à la table 'curriculum' de la base de données

        # Garantit, dans la table, l'unicité de chaque combinaison de 'code_ressource' + 'code_ue'
        unique_together = (('code_ressource', 'code_ue'),)


class Enseignements(models.Model):
    id_enseignement = models.AutoField(primary_key=True)   # Définit la clé primaire utilisée par Django
    id_enseignant = models.ForeignKey(   # Clé étrangère
        Enseignants,   # Pointe vers le modèle 'Enseignants' associé à la table 'enseignants'
        on_delete=models.CASCADE,   # Établit la suppression en cascade lors de la disparition d'une association
        db_column='id_enseignant',   # Pointe vers le champ 'id_enseignant' de la table 'enseignants'
        related_name='enseignements',   # Permet l'utilisation de requêtes inversées vers cette table
    )
    code_ressource = models.ForeignKey(   # Clé étrangère
        Ressources,   # Pointe vers le modèle 'Ressources' associé à la table 'ressources'
        on_delete=models.CASCADE,   # Établit la suppression en cascade lors de la disparition d'une association
        db_column='code_ressource',   # Pointe vers le champ 'code_ressource' de la table 'ressources'
        related_name='enseignements',   # Permet l'utilisation de requêtes inversées vers cette table
    )

    class Meta:
        managed = False   # Interdit à Django d'altérer la structure de la table
        db_table = 'enseignements'   # Associe le modèle à la table 'enseignements' de la base de données

        # Garantit, dans la table, l'unicité de chaque combinaison de 'id_enseignant' + 'code_ressource'
        unique_together = (('id_enseignant', 'code_ressource'),)
