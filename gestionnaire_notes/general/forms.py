from django.core.exceptions import ValidationError
from django.utils import formats
from django import forms
from .models import *
import datetime


class FormulaireUe(forms.ModelForm):
    class Meta:

        model = Ue
        fields = ['code_ue', 'nom', 'semestre', 'credits_ects']


class FormulaireRessources(forms.ModelForm):
    class Meta:

        model = Ressources
        fields = ['code_ressource', 'nom', 'descriptif', 'coefficient']


class FloatPositif(forms.FloatField):
    def validate(self, valeur):

        super().validate(valeur)

        if valeur < 0:

            raise ValidationError('La valeur ne peut pas être négative !')


def validation_positif(valeur):

    if valeur < 0:

        raise ValidationError('La valeur ne peut pas être négative !')


class FormulaireNotes(forms.ModelForm):

    id_etudiant = forms.ModelChoiceField(
        queryset=Etudiants.objects.all(),
        label="Étudiant",
        to_field_name="id_etudiant",
        widget=forms.Select(attrs={"class": "form-control"}),
    )
    code_ue = forms.ModelChoiceField(
        queryset=Ue.objects.all(),
        label="UE",
        to_field_name="code_ue",
        widget=forms.Select(attrs={"class": "form-control"}),
    )
    code_ressource = forms.ModelChoiceField(
        queryset=Ressources.objects.all(),
        label="Ressource",
        to_field_name="code_ressource",
        widget=forms.Select(attrs={"class": "form-control"}),
    )
    titre = forms.CharField(
        label="Titre de l'examen",
        widget=forms.TextInput(attrs={"class": "form-control"}),
    )
    date = forms.DateField(
        label="Date",
        widget=forms.SelectDateWidget(
            years=range(datetime.datetime.now().year, 2021, -1),
            attrs={"class": "form-control", "format": formats.get_format('DATE_INPUT_FORMATS')[2]}),
    )
    coefficient = forms.IntegerField(
        label="Coefficient",
        validators=[validation_positif],
        widget=forms.NumberInput(attrs={"class": "form-control", "min": "0"}),
    )
    note = FloatPositif(
        label="Note",
        widget=forms.NumberInput(attrs={"class": "form-control", "min": "0"}),
    )

    class Meta:
        model = Notes
        fields = ['id_etudiant', 'code_ue', 'code_ressource', 'titre', 'coefficient', 'note', 'appreciation', 'date']
        widgets = {
            "appreciation": forms.TextInput(attrs={"class": "form-control"}),
        }
