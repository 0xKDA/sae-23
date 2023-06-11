from django import template
import re

register = template.Library()


@register.filter
def nom_mois_majuscule(valeur):   # Utilise une regex pour passer la première lettre du nom du mois en majuscule

    return re.sub(r'(\b[a-z])', lambda lettre: lettre.group().upper(), valeur, 1)