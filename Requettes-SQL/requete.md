### Insert new records into the "Role" table 
INSERT INTO Role (role_nom) VALUES ('Admin');
INSERT INTO Role (role_nom) VALUES ('Client');

### Retrieve all the rows and columns from the "Role" table
SELECT * FROM Role;

### Update the "role_nom" column of the role with a "role_id" value of 2 and set it to 'Utilisateur'
UPDATE Role SET role_nom = 'Utilisateur' WHERE role_id = 2;

### Delete the role with a "role_id" value of 1 from the "Role" table
DELETE FROM Role WHERE role_id = 1;

###  Insert a new User table
INSERT INTO Utilisateur (username, email, password, role_id)
VALUES ('Kevin', 'kevin@gmail.com', 'Kevin123456!', 1);

### Insert a newrow into the "Cinema" table
INSERT INTO Cinema (cinema_nom, location) 
VALUES ('Cinema Gaumont Pathé', 'Paris 75010');

### Update the values into the "Cinema" table
UPDATE Cinema 
SET cinema_nom = 'UGC', location = 'Lyon' 
WHERE cinema_id = 1;

### Insert a new row into the "Salle" table
INSERT INTO Salle (salle_nom, cinema_id) 
VALUES ('Salle 1', 1);

###  Insert a new row into the "Seance" table 
INSERT INTO Seance (heure_debut, heure_fin, date_seance, salle_id) 
VALUES ('09:00:00', '11:00:00', '2023-06-20', 2);

###  Insert a new row into the "Film" table 
INSERT INTO Film (film_titre, genre, duration, description, seance_id) 
VALUES ('Batman', 'Fantastique', '01:30:00', ' Les super-héros DC sont bien connus contrairement aux super-vilains moins connus', 3);

###  Update the values into the "Seance" table
UPDATE Seance 
SET heure_debut = '10:00:00', heure_fin = '12:00:00', 
    date_seance = '2023-06-21', salle_id = 2 
WHERE seance_id = 1;

###  Insert a new row into the "Evaluation" table
INSERT INTO Evaluation (note, user_id, film_id) 
VALUES (8, 2, 3);

### Retrieve all records from Evaluation where user_id equals 2
SELECT * FROM Evaluation WHERE user_id = 2;


###  Retrieve the film title and date of the seance
SELECT Film.film_titre, Seance.date_seance
FROM Film
INNER JOIN Seance ON Film.seance_id = Seance.seance_id
INNER JOIN Salle ON Seance.salle_id = Salle.salle_id
WHERE Salle.salle_nom = 'Salle 1';

###  Insert a new row into the "Billet" table
INSERT INTO Billet (quantite, prix_total, user_id, seance_id)
VALUES (2, 50.00, 2, 3);

### Calculate the total number of tickets sold for seance_id = 3
SELECT SUM(quantite) AS total_billets_vendus
FROM Billet
WHERE seance_id = 3;
