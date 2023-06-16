CREATE DATABASE sae_23;
USE sae_23;

CREATE TABLE etudiants (
  id_etudiant INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  groupe VARCHAR(10),
  photo TEXT,
  email VARCHAR(255) NOT NULL,
  utilisateur_id INT UNIQUE,
  FOREIGN KEY (utilisateur_id) REFERENCES auth_user(id)
);

CREATE TABLE ressources (
  code_ressource VARCHAR(10) PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  descriptif TEXT,
  coefficient INT NOT NULL
);

CREATE TABLE examens (
  id_examen INT AUTO_INCREMENT PRIMARY KEY,
  titre VARCHAR(50) NOT NULL,
  date DATE NOT NULL,
  coefficient INT NOT NULL,
  code_ressource VARCHAR(10) NOT NULL,
  FOREIGN KEY (code_ressource) REFERENCES ressources(code_ressource)
);

CREATE TABLE notes (
  id_note INT AUTO_INCREMENT PRIMARY KEY,
  id_etudiant INT NOT NULL,
  id_examen INT NOT NULL,
  note DECIMAL(4,2) NOT NULL,
  appreciation TEXT,
  FOREIGN KEY (id_etudiant) REFERENCES etudiants(id_etudiant),
  FOREIGN KEY (id_examen) REFERENCES examens(id_examen),
  UNIQUE(id_etudiant, id_examen)
);

CREATE TABLE ue (
  code_ue VARCHAR(10) PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  semestre INT NOT NULL,
  credits_ects INT NOT NULL
);

CREATE TABLE enseignants (
  id_enseignant INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  utilisateur_id INT UNIQUE,
  FOREIGN KEY (utilisateur_id) REFERENCES auth_user(id)
);

CREATE TABLE curriculum (
  id_curriculum INT AUTO_INCREMENT PRIMARY KEY,
  code_ressource VARCHAR(10) NOT NULL,
  code_ue VARCHAR(10) NOT NULL,
  FOREIGN KEY (code_ressource) REFERENCES ressources(code_ressource),
  FOREIGN KEY (code_ue) REFERENCES ue(code_ue),
  UNIQUE(code_ressource, code_ue)
);

CREATE TABLE enseignements (
  id_enseignement INT AUTO_INCREMENT PRIMARY KEY,
  id_enseignant INT NOT NULL,
  code_ressource VARCHAR(10) NOT NULL,
  FOREIGN KEY (id_enseignant) REFERENCES enseignants(id_enseignant),
  FOREIGN KEY (code_ressource) REFERENCES ressources(code_ressource),
  UNIQUE(id_enseignant, code_ressource)
);

CREATE USER 'scribe'@'localhost' IDENTIFIED BY 'N0t1k3ScR1b3';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, REFERENCES, INDEX, ALTER ON sae_23.* TO 'scribe'@'localhost';

CREATE USER 'archivist'@'localhost' IDENTIFIED BY 'N0t1k34rCh1Vi5t';
GRANT SELECT, SHOW VIEW, EVENT, TRIGGER ON sae_23.* TO 'archivist'@'localhost';

FLUSH PRIVILEGES;