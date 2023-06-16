<h3 align="center"><u>Projet SAE23 : Gestionnaire de notes</u></h3> 

---  
* Le dossier "gestionnaire_notes" contient le code du projet en lui-même.  
* Le dossier ".idea" est spécifique à PyCharm et doit être ignoré par les autres IDE.
* Le dossier "backup" contient les scripts de chiffrement/déchiffrement de la base de données.
* Le dossier "cert" contient les fichiers relatifs au certificat SSL/TLS.
* Le dossier "init" contient le script relatif au lancement automatique.
* Le dossier "MySQL" contient un exemplaire de la base de données utilisée par le projet.
* Le dossier "Script MySQL" contient les scripts de création de la base de données.
  * /!\ Le script ne créé pas les groupes "Eleves" et "Professeurs" nativement !
  * /!\ De même, les relations "utilisateur" avec la table "auth_user" non plus !  
    * Les relations avec "auth_user" seront créés lors de la migration des modèles !
---
#### <u>Installer les dépendances sous PyCharm:</u>  


```
pip install -r dependencies.txt
```
&rarr; &nbsp; Ceci installera les versions spécifiques des dépendances utilisées dans le projet.  

---
#### <u>Vérifications élémentaires :</u>  


1. Créer un **superuser** s'il n'en existe pas déjà un :  
   ```
   python manage.py createsuperuser
   ```
   Sinon, voici les accès du superuser par défaut :
   
   Username | Password
   --- | ---
   admin | N0t1k34dM1n

2. Créer les groupes **"Eleves"** et **"Professeurs"** s'il n'existent pas :  

   * Via l'URL de l'interface d'administration Django : `''/admin/`

3. Vérifier que l'utilisateur de connexion à MySQL a les privilèges suffisants :  

   * Permissions nécessaires pour le CRUD :  
     ```sql
     GRANT SELECT, INSERT, UPDATE, DELETE ON sae_23.* TO `scribe`@`localhost`  
     ```
   * Permissions nécessaires pour les migrations :  
     ```sql
     GRANT CREATE, REFERENCES, INDEX, ALTER ON sae_23.* TO `scribe`@`localhost`  
     ```
   * Recharge les tables de privilèges :  
     ```sql
     `FLUSH PRIVILEGES;`
     ```

   <u>Voici les accès par défaut de l'utilisateur 'scribe'@'localhost' :</u>
   Username | Password
   --- | ---
   scribe | N0t1k3ScR1b3


4. Effectuer les migrations pour appliquer les changements à la base de données :  
   ```
   python manage.py makemigrations  
   python manage.py migrate
   ```

   **N.B. : Les relations 1-To-1 avec "auth_user" se feront lors de la migration des modèles.**
