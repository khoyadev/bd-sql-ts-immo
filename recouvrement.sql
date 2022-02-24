-- CREATION DE LA TABLE RECOUVREUR
CREATE TABLE recouvreur(
    id_recouvreur INTEGER PRIMARY KEY NOT NULL,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    CNI VARCHAR(255) NOT NULL,
    telephone VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    civilite VARCHAR(255) NOT NULL,
    date_naissance VARCHAR(255) NOT NULL
)


-- CREATION DE LA TABLE LOYER
CREATE TABLE loyer (
    id_loyer INTEGER PRIMARY KEY NOT NULL,
    montant_location VARCHAR(255) NOT NULL,
    dates DATE
    id_recouvreur INTEGER ,
    CONSTRAINT FK_RECOUVREUR_LOYER FOREIGN KEY(id_recouvreur) 
    REFERENCES recouvreur(id_recouvreur)
    
    id_penalite INTEGER ,
    CONSTRAINT FK_PENALITE_LOYER FOREIGN KEY(id_penalite)
    REFERENCES penalite(id_penalite)
    
    id_avance INTEGER ,
    CONSTRAINT FK_RECOUVREUR_LOYER FOREIGN KEY(id_avance) 
    REFERENCES avance(id_avance)

    id_mensualite INTEGER ,
    CONSTRAINT FK_MENSUALITE_LOYER FOREIGN KEY(id_mensualite) 
    REFERENCES mensualite(id_mensualite)
)

-- CREATION DE LA TABLE PENALITE
CREATE TABLE penalite (
    id_penalite INTEGER PRIMARY KEY NOT NULL,
    montant VARCHAR(255) NOT NULL,
    dates DATE

)
-- CREATION DE LA TABLE MENSUALITE
CREATE TABLE mensualite (
    id_mensualite INTEGER PRIMARY KEY NOT NULL,
    libelle VARCHAR(255) NOT NULL,

)
-- CREATION DE LA TABLE AVANCE
CREATE TABLE avance (
    id_avance INTEGER PRIMARY KEY NOT NULL,
    montant_percu VARCHAR(255) NOT NULL,
    dates DATE
)
