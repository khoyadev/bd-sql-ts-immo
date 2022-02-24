-- CREATION DE LA TABLE LOCATAIRE
CREATE TABLE locataire(
id_locataire INTEGER PRIMARY KEY AUTO_INCREMENT,
nom_locataire VARCHAR(50),
prenom_locataire VARCHAR(50),
raison_sociale VARCHAR(50),
ninea VARCHAR(20),
numero_cni VARCHAR(15),
id_type_locataire INTEGER,
CONSTRAINT FK_LOCATAIRE FOREIGN KEY(id_type_locataire)
REFERENCES type_locataire(id_type_locataire)
);

-- CREATTION DE LA TABLE TYPE DE LOCATAIRE
CREATE TABLE type_locataire(
id_type_locataire INTEGER AUTO_INCREMENT PRIMARY KEY,
libelle_type_locataire VARCHAR(15)
);

-- CREATION DE LA TABLE CONTRAT
CREATE TABLE contrat(
 id_contrat INTEGER PRIMARY KEY AUTO_INCREMENT,
 date_location DATE,
 numero_location VARCHAR(50),
 date_debut_location DATE,
 date_fin_location DATE,
 montant_loyer INTEGER,
 etat BOOLEAN,
 is_renouvelable BOOLEAN,
 id_locataire INTEGER,
 CONSTRAINT FK_LOCATAIRE_CONTRAT FOREIGN KEY(id_locataire)
 REFERENCES locataire(id_locataire)
 );

-- CREATION DE LA TABLE CONDITION FINANCIERE
CREATE TABLE condition_financiere(
id_condition_financiere INTEGER PRIMARY KEY AUTO_INCREMENT,
libelle_condition_financiere VARCHAR(50),
id_contrat INTEGER,
CONSTRAINT FK_CONDITION_CONTRAT FOREIGN KEY(id_contrat)
REFERENCES contrat(id_contrat)
);

-- CREATION DE LA TABLE CHARGE
CREATE TABLE charge(
id_charge INTEGER PRIMARY KEY AUTO_INCREMENT,
montant_charge INTEGER,
libelle_charge VARCHAR(50),
id_condition_financiere INTEGER,
CONSTRAINT FK_CONDITION_CHARGE FOREIGN KEY(id_condition_financiere)
REFERENCES condition_financiere(id_condition_financiere)
);

