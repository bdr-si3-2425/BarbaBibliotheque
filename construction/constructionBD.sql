CREATE TABLE ABONNE (
  PRIMARY KEY (id_abonne),
  id_abonne      VARCHAR(42) NOT NULL,
  nom            VARCHAR(42),
  prenom         VARCHAR(42),
  email          VARCHAR(42),
  date_naissance DATE, 
  lieu_naissance VARCHAR(42),
  region         VARCHAR(42),
  CONSTRAINT chk_dates CHECK (date_naissance <= CURRENT_DATE)
);

CREATE TABLE ATTENTE (
  PRIMARY KEY (id_edition, id_abonne),
  id_edition VARCHAR(42) NOT NULL,
  id_abonne VARCHAR(42) NOT NULL,
  rang INT
);

CREATE TABLE ASSISTE (
  PRIMARY KEY (id_abonne, id_evenement),
  id_abonne    VARCHAR(42) NOT NULL,
  id_evenement VARCHAR(42) NOT NULL
);

CREATE TABLE AUTEUR (
  PRIMARY KEY (id_auteur),
  id_auteur      VARCHAR(42) NOT NULL,
  nom            VARCHAR(42),
  prenom         VARCHAR(42),
  pseudo         VARCHAR(42),
  date_naissance DATE,
  lieu_naissance VARCHAR(42),
  date_mort      DATE,
  CONSTRAINT chk_dates CHECK (date_naissance <= CURRENT_DATE)
);

CREATE TABLE A_ECRIT (
  PRIMARY KEY (id_auteur, id_oeuvre),
  id_auteur VARCHAR(42) NOT NULL,
  id_oeuvre VARCHAR(42) NOT NULL
);

CREATE TABLE BIBLIOTHEQUE (
  PRIMARY KEY (id_biblio),
  id_biblio      VARCHAR(42) NOT NULL,
  ville          VARCHAR(42),
  adresse        VARCHAR(42),
  code_postal    VARCHAR(42),
  nom           VARCHAR(42),
  capacite       VARCHAR(42),
  note           INT,
  nombre_ouvrage INT
);

CREATE TABLE BLACKLIST (
  PRIMARY KEY (id_abonne, date_deb),
  id_abonne VARCHAR(42) NOT NULL,
  date_deb  DATE,
  date_fin  DATE,
  CONSTRAINT chk_dates CHECK (date_fin >= date_deb),
  CONSTRAINT chk_dates2 CHECK (date_deb <= CURRENT_DATE)
);

CREATE TABLE COMMANDE (
  PRIMARY KEY (id_biblio, id_edition, date),
  id_biblio  VARCHAR(42) NOT NULL,
  id_edition VARCHAR(42) NOT NULL,
  date       DATE,
  raison     VARCHAR(42),
  CONSTRAINT chk_dates CHECK (date <= CURRENT_DATE)
);

CREATE TABLE EDITEUR (
  PRIMARY KEY (id_editeur),
  id_editeur VARCHAR(42) NOT NULL,
  nom        VARCHAR(42),
  adresse    VARCHAR(42),
  ville      VARCHAR(42),
  id_pays    VARCHAR(42) NULL
);

CREATE TABLE EDITION (
  PRIMARY KEY (id_edition),
  id_edition     VARCHAR(42) NOT NULL,
  ISBN          VARCHAR(42),
  titre         VARCHAR(42),
  date_publi    DATE,
  format        VARCHAR(42),
  nb_page       INT,
  disponibilite VARCHAR(42),
  id_oeuvre     VARCHAR(42) NULL,
  id_editeur    VARCHAR(42) NOT NULL,
  CONSTRAINT chk_dates CHECK (date_publi <= CURRENT_DATE)
);

CREATE TABLE EVENEMENT (
  PRIMARY KEY (id_evenement),
  id_evenement VARCHAR(42) NOT NULL,
  nom          VARCHAR(42),
  type         VARCHAR(42),
  adresse      VARCHAR(42),
  ville        VARCHAR(42),
  date_deb     DATE,
  date_fin     DATE,
  CONSTRAINT chk_dates CHECK (date_fin >= date_deb),
  CONSTRAINT chk_dates2 CHECK (date_deb <= CURRENT_DATE)
);

CREATE TABLE EST_DE (
  PRIMARY KEY (id_Pays, id_auteur),
  id_Pays VARCHAR(42) NOT NULL,
  id_auteur      VARCHAR(42) NOT NULL
);

CREATE TABLE EMPRUNT (
  PRIMARY KEY (id_edition, id_abonne),
  id_edition   VARCHAR(42) NOT NULL,
  id_abonne    VARCHAR(42) NOT NULL,
  date_emprunt DATE NOT NULL,
  date_prevu   DATE NOT NULL,
  date_retour  DATE, 
  etat_init    VARCHAR(42) NOT NULL, 
  etat_retour  VARCHAR(42),
  CONSTRAINT chk_dates CHECK (date_prevu IS NULL OR date_prevu >= date_emprunt),
  CONSTRAINT chk_dates2 CHECK (date_retour IS NULL OR date_retour >= date_emprunt),
  CONSTRAINT chk_dates3 CHECK (date_emprunt <= CURRENT_DATE)
);

CREATE TABLE OEUVRE (
  PRIMARY KEY (id_oeuvre),
  id_oeuvre    VARCHAR(42) NOT NULL,
  description  VARCHAR(42),
  genre        VARCHAR(42),
  score        FLOAT
);

CREATE TABLE ORGANISE (
  PRIMARY KEY (id_biblio, id_evenement),
  id_biblio     VARCHAR(42) NOT NULL,
  id_evenement  VARCHAR(42) NOT NULL
);

CREATE TABLE PARTICIPE (
  PRIMARY KEY (id_auteur, id_evenement),
  id_auteur     VARCHAR(42) NOT NULL,
  id_evenement  VARCHAR(42) NOT NULL
);

CREATE TABLE PAYS (
  PRIMARY KEY (id_pays),
  id_pays      VARCHAR(42) NOT NULL,
  pays         VARCHAR(42),
  langue       VARCHAR(42),
  nationalite  VARCHAR(42)
);

CREATE TABLE POSSEDE (
  PRIMARY KEY (id_edition, id_biblio),
  id_edition  VARCHAR(42) NOT NULL,
  id_biblio   VARCHAR(42) NOT NULL,
  quantite    INT,
  CONSTRAINT chk_quantite CHECK (0 <= quantite)
);

CREATE TABLE SERIE (
  PRIMARY KEY (id_oeuvre_1, id_oeuvre_2),
  id_oeuvre_1 VARCHAR(42) NOT NULL,
  id_oeuvre_2 VARCHAR(42) NOT NULL,
  nom         VARCHAR(42),
  nb_livre    INT,
  genre       VARCHAR(42),
  CONSTRAINT chk_quantite CHECK (0 <= nb_livre)
);

CREATE TABLE SOUSCRIT (
  PRIMARY KEY (id_abonne, id_biblio),
  id_abonne         VARCHAR(42) NOT NULL,
  id_biblio         VARCHAR(42) NOT NULL,
  debut_abonnement  DATE NOT NULL,
  fin_abonnement    DATE,
  souscription      VARCHAR(42)
  CONSTRAINT chk_dates CHECK (fin_abonnement >= debut_abonnement),
  CONSTRAINT chk_dates2 CHECK (debut_abonnement <= CURRENT_DATE)
);

CREATE TABLE TRANSFERT (
  PRIMARY KEY (id_biblio_source, id_biblio_dest, id_edition, date_debut, date_fin),
  id_biblio_source VARCHAR(42) NOT NULL,
  id_biblio_dest   VARCHAR(42) NOT NULL,
  id_edition       VARCHAR(42) NOT NULL,
  date_debut       DATE NOT NULL, 
  date_fin         DATE NOT NULL, 
  description     VARCHAR(42),
  cout           INT
  CONSTRAINT chk_dates CHECK (date_fin >= date_debut),
  CONSTRAINT chk_dates2 CHECK (date_debut <= CURRENT_DATE),
  CONSTRAINT chk_quantite CHECK (0 <= cout)
);

ALTER TABLE ASSISTE ADD FOREIGN KEY (id_evenement) REFERENCES EVENEMENT (id_evenement);
ALTER TABLE ASSISTE ADD FOREIGN KEY (id_abonne) REFERENCES ABONNE (id_abonne);

ALTER TABLE ATTENTE ADD FOREIGN KEY (id_abonne) REFERENCES ABONNE (id_abonne);
ALTER TABLE ATTENTE ADD FOREIGN KEY (id_edition) REFERENCES EDITION (id_edition);

ALTER TABLE A_ECRIT ADD FOREIGN KEY (id_oeuvre) REFERENCES OEUVRE (id_oeuvre);
ALTER TABLE A_ECRIT ADD FOREIGN KEY (id_auteur) REFERENCES AUTEUR (id_auteur);

ALTER TABLE BLACKLIST ADD FOREIGN KEY (id_abonne) REFERENCES ABONNE (id_abonne);

ALTER TABLE COMMANDE ADD FOREIGN KEY (id_edition) REFERENCES EDITION (id_edition);
ALTER TABLE COMMANDE ADD FOREIGN KEY (id_biblio) REFERENCES BIBLIOTHEQUE (id_biblio);

ALTER TABLE EDITEUR ADD FOREIGN KEY (id_pays) REFERENCES PAYS (id_pays);

ALTER TABLE EDITION ADD FOREIGN KEY (id_editeur) REFERENCES EDITEUR (id_editeur);
ALTER TABLE EDITION ADD FOREIGN KEY (id_oeuvre) REFERENCES OEUVRE (id_oeuvre);

ALTER TABLE EMPRUNT ADD FOREIGN KEY (id_abonne) REFERENCES ABONNE (id_abonne);
ALTER TABLE EMPRUNT ADD FOREIGN KEY (id_edition) REFERENCES EDITION (id_edition);

ALTER TABLE EST_DE ADD FOREIGN KEY (id_auteur) REFERENCES AUTEUR (id_auteur);
ALTER TABLE EST_DE ADD FOREIGN KEY (id_Pays) REFERENCES PAYS (id_Pays);

ALTER TABLE ORGANISE ADD FOREIGN KEY (id_evenement) REFERENCES EVENEMENT (id_evenement);
ALTER TABLE ORGANISE ADD FOREIGN KEY (id_biblio) REFERENCES BIBLIOTHEQUE (id_biblio);

ALTER TABLE PARTICIPE ADD FOREIGN KEY (id_evenement) REFERENCES EVENEMENT (id_evenement);
ALTER TABLE PARTICIPE ADD FOREIGN KEY (id_auteur) REFERENCES AUTEUR (id_auteur);

ALTER TABLE POSSEDE ADD FOREIGN KEY (id_biblio) REFERENCES BIBLIOTHEQUE (id_biblio);
ALTER TABLE POSSEDE ADD FOREIGN KEY (id_edition) REFERENCES EDITION (id_edition);

ALTER TABLE SERIE ADD FOREIGN KEY (id_oeuvre_2) REFERENCES OEUVRE (id_oeuvre);
ALTER TABLE SERIE ADD FOREIGN KEY (id_oeuvre_1) REFERENCES OEUVRE (id_oeuvre);

ALTER TABLE SOUSCRIT ADD FOREIGN KEY (id_biblio) REFERENCES BIBLIOTHEQUE (id_biblio);
ALTER TABLE SOUSCRIT ADD FOREIGN KEY (id_abonne) REFERENCES ABONNE (id_abonne);

ALTER TABLE TRANSFERT ADD FOREIGN KEY (id_edition) REFERENCES EDITION (id_edition);
ALTER TABLE TRANSFERT ADD FOREIGN KEY (id_biblio_source) REFERENCES BIBLIOTHEQUE (id_biblio);
ALTER TABLE TRANSFERT ADD FOREIGN KEY (id_biblio_dest) REFERENCES BIBLIOTHEQUE (id_biblio);
