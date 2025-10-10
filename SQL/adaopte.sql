-- Table Animals
CREATE TABLE "Animals"(
    "id" BIGSERIAL PRIMARY KEY,
    "type" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "age" BIGINT NOT NULL,
    "breed" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "zipcode" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "adopter_id" BIGINT NULL
);

-- Table Volunteers
CREATE TABLE "Volunteers"(
    "id" BIGSERIAL PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "zipcode" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "motivation" TEXT NOT NULL,
    "availability" TEXT NOT NULL
);

-- Table RDVs
CREATE TABLE "RDVs"(
    "id" BIGSERIAL PRIMARY KEY,
    "animal_id" BIGINT NOT NULL,
    "volunteer_id" BIGINT NOT NULL,
    "date" DATE NOT NULL,
    "time" TIME(0) WITHOUT TIME ZONE NOT NULL,
    CONSTRAINT "rdvs_volunteer_id_foreign" FOREIGN KEY("volunteer_id") REFERENCES "Volunteers"("id"),
    CONSTRAINT "rdvs_animal_id_foreign" FOREIGN KEY("animal_id") REFERENCES "Animals"("id")
);

-- Foreign key pour adopter_id
ALTER TABLE "Animals" 
ADD CONSTRAINT "animals_adopter_id_foreign" FOREIGN KEY("adopter_id") REFERENCES "Volunteers"("id");

-- Insérer trois volunteers
INSERT INTO "Volunteers" 
(first_name, last_name, zipcode, city, email, motivation, availability)
VALUES
('Alice', 'Martin', '75011', 'Paris', 'alice.martin@example.com', 'J’adore les animaux et je veux aider.', 'Week-ends'),
('Bob', 'Dupont', '69003', 'Lyon', 'bob.dupont@example.com', 'Je veux donner du temps pour le bien-être des animaux.', 'Soirées en semaine'),
('Clara', 'Lefevre', '13001', 'Marseille', 'clara.lefevre@example.com', 'Passionnée par le volontariat auprès des chiens et chats.', 'Matinées et après-midis');

-- Insérer les data des animaux
INSERT INTO "Animals" (type, name, age, breed, city, zipcode, description)
VALUES
('Chien', 'Charlie', 5, 'Pug', 'Lille', '59000', 'Charlie est un petit chien calme et affectueux qui adore les balades tranquilles et les caresses sur le canapé.'),
('Chat', 'Mia', 2, 'Chat noir et blanc', 'Strasbourg', '67000', 'Mia est une boule de tendresse curieuse et joueuse, toujours prête à ronronner près de vous.'),
('Lapin', 'Coco', 1, 'Lapin', 'Annecy', '74000', 'Coco est un petit lapin plein d’énergie, très doux et parfait pour un foyer aimant et paisible.'),
('Chien', 'Rex', 4, 'Chow-chow', 'Grenoble', '38000', 'Rex est un chien loyal et majestueux, idéal pour une personne douce et patiente qui aime les câlins silencieux.'),
('Chat', 'Luna', 3, 'Chat Roux', 'Bordeaux', '33000', 'Luna adore les coins ensoleillés et les siestes à vos côtés. Elle vous offrira tout l’amour d’un regard félin.'),
('Rongeur', 'Biscuit', 0, 'Cochon d''Inde', 'Tours', '37000', 'Biscuit est tout petit mais plein de vie ! Il aime les légumes croquants et les instants de douceur en famille.'),
('Lapin', 'Rio', 0, 'Lapin nain brun', 'Poitiers', '86000', 'Rio est discret, mignon comme tout, et adore explorer les petits coins de la maison avec délicatesse.'),
('Chien', 'Ruby', 2, 'Chien Samoyed', 'Chamonix', '74400', 'Ruby est une boule de neige pleine d’amour ! Elle adore les promenades et les câlins par temps frais.');

-- insérer data des RDVs
INSERT INTO "RDVs" (animal_id, volunteer_id, date, time)
VALUES
(1, 1, '2025-09-15', '10:00:00'),  -- Charlie avec Alice
(2, 2, '2025-09-16', '14:30:00'),  -- Mia avec Bob
(3, 3, '2025-09-17', '09:15:00');  -- Coco avec Clara




