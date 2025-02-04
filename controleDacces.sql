-- creation des roles
/*
Création de trois rôles : admin, employee et subscriber.
Ces rôles seront attribués aux utilisateurs en fonction de leurs privilèges.
sql
*/

CREATE ROLE admin;
CREATE ROLE employee;
CREATE ROLE subscriber;


/*
Admin : a tous les droits (lecture, insertion, mise à jour, suppression) sur toutes les tables.
Employee : a seulement le droit de lecture sur toutes les tables.
Subscriber : ne peut consulter que les tables ABONNE, EDITION, et BIBLIOTHEQUE
*/
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO admin;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO employee;
GRANT SELECT ON ABONNE, EDITION, BIBLIOTHEQUE TO subscriber;

/*
Attribution des rôles respectifs aux utilisateurs : user_admin, user_employee, et user_subscriber.
*/
GRANT admin TO user_admin;
GRANT employee TO user_employee;
GRANT subscriber TO user_subscriber;