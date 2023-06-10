from django.db import models


class Etudiants(models.Model):
    id_etudiant = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=50)
    prenom = models.CharField(max_length=50)
    groupe = models.CharField(max_length=10)
    photo = models.TextField(blank=True, null=True)
    email = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'etudiants'


class Examens(models.Model):
    id_examen = models.AutoField(primary_key=True)
    titre = models.CharField(max_length=50)
    date = models.DateField()
    coefficient = models.IntegerField()
    code_ressource = models.ForeignKey('Ressources', models.DO_NOTHING, db_column='code_ressource')

    class Meta:
        managed = False
        db_table = 'examens'


class Notes(models.Model):
    id_note = models.AutoField(primary_key=True)
    id_etudiant = models.ForeignKey(Etudiants, models.DO_NOTHING, db_column='id_etudiant')
    id_examen = models.ForeignKey(Examens, models.DO_NOTHING, db_column='id_examen')
    note = models.DecimalField(max_digits=4, decimal_places=2)
    appreciation = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'notes'
        unique_together = (('id_etudiant', 'id_examen'),)


class Ue(models.Model):
    code_ue = models.CharField(primary_key=True, max_length=10)
    nom = models.CharField(max_length=50)
    semestre = models.IntegerField()
    credits_ects = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'ue'


class Ressources(models.Model):
    code_ressource = models.CharField(primary_key=True, max_length=10)
    nom = models.CharField(max_length=50)
    descriptif = models.TextField(blank=True, null=True)
    coefficient = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'ressources'


class Enseignants(models.Model):
    id_enseignant = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=50)
    prenom = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'enseignants'


class Curriculum(models.Model):
    id_curriculum = models.AutoField(primary_key=True)
    code_ressource = models.ForeignKey(Ressources, models.DO_NOTHING, db_column='code_ressource')
    code_ue = models.ForeignKey(Ue, models.DO_NOTHING, db_column='code_ue')

    class Meta:
        managed = False
        db_table = 'curriculum'
        unique_together = (('code_ressource', 'code_ue'),)


class Enseignements(models.Model):
    id_enseignement = models.AutoField(primary_key=True)
    id_enseignant = models.ForeignKey(Enseignants, models.DO_NOTHING, db_column='id_enseignant')
    code_ressource = models.ForeignKey(Ressources, models.DO_NOTHING, db_column='code_ressource')

    class Meta:
        managed = False
        db_table = 'enseignements'
        unique_together = (('id_enseignant', 'code_ressource'),)
