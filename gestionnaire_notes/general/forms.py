from django import forms
from .models import *


class FormulaireUe(forms.ModelForm):
    class Meta:

        model = Ue
        fields = ['code_ue', 'nom', 'semestre', 'credits_ects']


class FormulaireRessources(forms.ModelForm):
    class Meta:

        model = Ressources
        fields = ['code_ressource', 'nom', 'descriptif', 'coefficient']
