CREATE TABLE ABONNE (
  PRIMARY KEY (id),
  id             VARCHAR(42) NOT NULL,
  nom            VARCHAR(42),
  prenom         VARCHAR(42),
  email          VARCHAR(42),
  date_naissance VARCHAR(42),
  lieu_naissance VARCHAR(42),
  region         VARCHAR(42)
);

CREATE TABLE ASSISTE (
  PRIMARY KEY (id_1, id_2),
  id_1 VARCHAR(42) NOT NULL,
  id_2 VARCHAR(42) NOT NULL
);

CREATE TABLE AUTEUR (
  PRIMARY KEY (id),
  id             VARCHAR(42) NOT NULL,
  nom            VARCHAR(42),
  prenom         VARCHAR(42),
  pseudo         VARCHAR(42),
  date_naissance VARCHAR(42),
  lieu_naissance VARCHAR(42),
  date_mort      VARCHAR(42)
);

CREATE TABLE A_ECRIT (
  PRIMARY KEY (id_1, id_2),
  id_1 VARCHAR(42) NOT NULL,
  id_2 VARCHAR(42) NOT NULL
);

CREATE TABLE BIBLIOTHEQUE (
  PRIMARY KEY (id),
  id             VARCHAR(42) NOT NULL,
  ville          VARCHAR(42),
  adresse        VARCHAR(42),
  code_postal    VARCHAR(42),
  nom            VARCHAR(42),
  capacite       VARCHAR(42),
  note           VARCHAR(42),
  nombre_ouvrage VARCHAR(42),
  id_2           VARCHAR(42) NOT NULL,
  id_3           VARCHAR(42) NOT NULL,
  date           VARCHAR(42),
  description    VARCHAR(42),
  cout           VARCHAR(42)
);

CREATE TABLE BLACKLIST (
  PRIMARY KEY (id),
  id       VARCHAR(42) NOT NULL,
  date_deb VARCHAR(42),
  date_fin VARCHAR(42)
);

CREATE TABLE COMMANDE (
  PRIMARY KEY (id_1, id_2),
  id_1   VARCHAR(42) NOT NULL,
  id_2   VARCHAR(42) NOT NULL,
  date   VARCHAR(42),
  raison VARCHAR(42)
);

CREATE TABLE EDITEUR (
  PRIMARY KEY (id),
  id      VARCHAR(42) NOT NULL,
  nom     VARCHAR(42),
  adresse VARCHAR(42),
  ville   VARCHAR(42),
  id_Pays VARCHAR(42) NULL
);

CREATE TABLE EDITION (
  PRIMARY KEY (id),
  id            VARCHAR(42) NOT NULL,
  ISBN          VARCHAR(42),
  titre         VARCHAR(42),
  date_publi    VARCHAR(42),
  format        VARCHAR(42),
  nb_page       VARCHAR(42),
  disponibilite VARCHAR(42),
  id_2          VARCHAR(42) NOT NULL,
  id_3          VARCHAR(42) NOT NULL,
  rang          VARCHAR(42),
  id_4          VARCHAR(42) NOT NULL,
  id_5          VARCHAR(42) NOT NULL,
  date_emprunt  VARCHAR(42),
  date_prevu    VARCHAR(42),
  date_retour   VARCHAR(42),
  etat_init     VARCHAR(42),
  etat_retour   VARCHAR(42),
  id_6          VARCHAR(42) NULL,
  id_7          VARCHAR(42) NOT NULL,
  UNIQUE (id_2),
  UNIQUE (id_3),
  UNIQUE (id_4),
  UNIQUE (id_5)
);

CREATE TABLE EST_DE (
  PRIMARY KEY (id_Pays, id),
  id_Pays VARCHAR(42) NOT NULL,
  id      VARCHAR(42) NOT NULL
);

CREATE TABLE EVENEMENT (
  PRIMARY KEY (id),
  id       VARCHAR(42) NOT NULL,
  nom      VARCHAR(42),
  type     VARCHAR(42),
  adresse  VARCHAR(42),
  ville    VARCHAR(42),
  date_deb VARCHAR(42),
  date_fin VARCHAR(42)
);

CREATE TABLE OEUVRE (
  PRIMARY KEY (id),
  id          VARCHAR(42) NOT NULL,
  description VARCHAR(42),
  genre       VARCHAR(42),
  score       VARCHAR(42)
);

CREATE TABLE ORGANISE (
  PRIMARY KEY (id_1, id_2),
  id_1 VARCHAR(42) NOT NULL,
  id_2 VARCHAR(42) NOT NULL
);

CREATE TABLE PARTICIPE (
  PRIMARY KEY (id_1, id_2),
  id_1 VARCHAR(42) NOT NULL,
  id_2 VARCHAR(42) NOT NULL
);

CREATE TABLE PAYS (
  PRIMARY KEY (id_Pays),
  id_Pays     VARCHAR(42) NOT NULL,
  pays        VARCHAR(42),
  langue      VARCHAR(42),
  nationalite VARCHAR(42)
);

CREATE TABLE POSSEDE (
  PRIMARY KEY (id_1, id_2),
  id_1     VARCHAR(42) NOT NULL,
  id_2     VARCHAR(42) NOT NULL,
  quantite VARCHAR(42)
);

CREATE TABLE SERIE (
  PRIMARY KEY (id_1, id_2),
  id_1     VARCHAR(42) NOT NULL,
  id_2     VARCHAR(42) NOT NULL,
  nom      VARCHAR(42),
  nb_livre VARCHAR(42),
  genre    VARCHAR(42)
);

CREATE TABLE SOUSCRIT (
  PRIMARY KEY (id_1, id_2),
  id_1             VARCHAR(42) NOT NULL,
  id_2             VARCHAR(42) NOT NULL,
  debut_abonnement VARCHAR(42),
  fin_abonnement   VARCHAR(42),
  souscription     VARCHAR(42)
);

ALTER TABLE ASSISTE ADD FOREIGN KEY (id_2) REFERENCES EVENEMENT (id);
ALTER TABLE ASSISTE ADD FOREIGN KEY (id_1) REFERENCES ABONNE (id);

ALTER TABLE A_ECRIT ADD FOREIGN KEY (id_2) REFERENCES OEUVRE (id);
ALTER TABLE A_ECRIT ADD FOREIGN KEY (id_1) REFERENCES AUTEUR (id);

ALTER TABLE BIBLIOTHEQUE ADD FOREIGN KEY (id_3) REFERENCES EDITION (id);
ALTER TABLE BIBLIOTHEQUE ADD FOREIGN KEY (id_2) REFERENCES BIBLIOTHEQUE (id);

ALTER TABLE BLACKLIST ADD FOREIGN KEY (id) REFERENCES ABONNE (id);

ALTER TABLE COMMANDE ADD FOREIGN KEY (id_2) REFERENCES EDITION (id);
ALTER TABLE COMMANDE ADD FOREIGN KEY (id_1) REFERENCES BIBLIOTHEQUE (id);

ALTER TABLE EDITEUR ADD FOREIGN KEY (id_Pays) REFERENCES PAYS (id_Pays);

ALTER TABLE EDITION ADD FOREIGN KEY (id_7) REFERENCES EDITEUR (id);
ALTER TABLE EDITION ADD FOREIGN KEY (id_6) REFERENCES OEUVRE (id);
ALTER TABLE EDITION ADD FOREIGN KEY (id_5) REFERENCES BIBLIOTHEQUE (id);
ALTER TABLE EDITION ADD FOREIGN KEY (id_4) REFERENCES ABONNE (id);
ALTER TABLE EDITION ADD FOREIGN KEY (id_3) REFERENCES BIBLIOTHEQUE (id);
ALTER TABLE EDITION ADD FOREIGN KEY (id_2) REFERENCES ABONNE (id);

ALTER TABLE EST_DE ADD FOREIGN KEY (id) REFERENCES AUTEUR (id);
ALTER TABLE EST_DE ADD FOREIGN KEY (id_Pays) REFERENCES PAYS (id_Pays);

ALTER TABLE ORGANISE ADD FOREIGN KEY (id_2) REFERENCES EVENEMENT (id);
ALTER TABLE ORGANISE ADD FOREIGN KEY (id_1) REFERENCES BIBLIOTHEQUE (id);

ALTER TABLE PARTICIPE ADD FOREIGN KEY (id_2) REFERENCES EVENEMENT (id);
ALTER TABLE PARTICIPE ADD FOREIGN KEY (id_1) REFERENCES AUTEUR (id);

ALTER TABLE POSSEDE ADD FOREIGN KEY (id_2) REFERENCES BIBLIOTHEQUE (id);
ALTER TABLE POSSEDE ADD FOREIGN KEY (id_1) REFERENCES EDITION (id);

ALTER TABLE SERIE ADD FOREIGN KEY (id_2) REFERENCES OEUVRE (id);
ALTER TABLE SERIE ADD FOREIGN KEY (id_1) REFERENCES OEUVRE (id);

ALTER TABLE SOUSCRIT ADD FOREIGN KEY (id_2) REFERENCES BIBLIOTHEQUE (id);
ALTER TABLE SOUSCRIT ADD FOREIGN KEY (id_1) REFERENCES ABONNE (id);