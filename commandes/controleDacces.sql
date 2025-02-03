-- creation des roles
CREATE ROLE admin;
CREATE ROLE employee;
CREATE ROLE subscriber;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO admin;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO employee;
GRANT SELECT ON ABONNE, EDITION, BIBLIOTHEQUE TO subscriber;

GRANT admin TO admin_bibli;
GRANT employee TO user_employee;
GRANT subscriber TO user_subscriber;