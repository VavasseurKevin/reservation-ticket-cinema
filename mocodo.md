### Entrée pour la création MCD sur mocodo.net
:
:
Avoir, 11 Utilisateur, 1N Role
Role: role_id (PK, int, NOT NULL), role_nom (varchar, NOT NULL)
:

:
Reserver, 1N Utilisateur, 11 Billet
Utilisateur: user_id (PK, int, NOT NULL), username (varchar, NOT NULL), email (varchar, NOT NULL), password (varchar, NOT NULL), role_id (FK vers Role, int, NOT NULL)
Noter, 1N Utilisateur, 11 Evaluation
Evaluation: note_id (PK, int, NOT NULL), film_id (FK vers Film, int, NOT NULL), user_id (FK vers Utilisateur, int, NOT NULL), note(int, NOT NULL)

:
Billet: billet_id (PK, int, NOT NULL), user_id (FK vers Utilisateur, int, NOT NULL), seance_id (FK vers Seance, int, NOT NULL), quantite(int, NOT NULL), prix_total(decimal, NOT NULL)
Relier, 11 Billet, 1N Seance
:
Evalue, 11 Evaluation, 1N Film

:
Avoir_lieu, 11 Salle, 11 Seance
Seance: seance_id (PK, int, NOT NULL), film_id (FK vers Film, int, NOT NULL), salle_id (FK vers Salle, int, NOT NULL), heure_debut (time, NOT NULL), heure_fin(time, NOT NULL), date_seance (date, NOT NULL)
Projetee , 1N Seance, 11 Film
Film: film_id (PK, int, NOT NULL), film_titre (varchar, NOT NULL), genre (varchar, NOT NULL), duration (time, NOT NULL), description (varchar, NOT NULL)

:
Salle: salle_id (PK, int, NOT NULL), salle_nom (varchar, NOT NULL), cinema_id (FK vers Cinema, int, NOT NULL)
:
:
:

Cinema: cinema_id (PK, int, NOT NULL), cinema_nom (varchar, NOT NULL), location (varchar, NOT NULL)
Appartient, 1N Cinema, 11 Salle
:
:
: