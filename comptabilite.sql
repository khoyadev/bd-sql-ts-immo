--------------------------  Base de données TS IMMO --------------------------------

/* Requêtes sql de création de base de données */
CREATE DATABASE IF NOT EXISTS `tsimmo`;

USE `tsimmo`;

-- REQUÊTES SUR LES TABLES
SHOW TABLES FROM `tsimmo`; 
SHOW TABLES; 


/* Requêtes sql de création de la table operation */

CREATE TABLE IF NOT EXISTS `operation`
(
    `id_operation` INT NOT NULL AUTO_INCREMENT,
    `date_operation` DATE,
    `montant_operation` VARCHAR(65) NOT NULL,
    `etat` BOOLEAN,
    PRIMARY KEY(`id_operation`)
); 

/* Requêtes sql de création de la table cloture */

CREATE TABLE IF NOT EXISTS `cloture`
(
    `id_cloture` INT NOT NULL AUTO_INCREMENT,
    `date_debut` DATE,
    `date_fin` DATE,
    `bloque` BOOLEAN,
    `bloque` BOOLEAN,
    PRIMARY KEY(`id_cloture`)

); 

/* Requêtes sql de création de la table type cloture */

CREATE TABLE IF NOT EXISTS `typecloture`
(
    `id_typecloture` INT NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(65) NOT NULL,
    `id_cloct` INT NOT NULL,
    PRIMARY KEY(`id_typecloture`),
    FOREIGN KEY(`id_cloct`) REFERENCES `cloture`(`id_cloture`)
); 

/* Requêtes sql de création de la table gerant */

CREATE TABLE IF NOT EXISTS `gerant`
(
    `id_gerant` INT NOT NULL AUTO_INCREMENT,
    `nom_gerant` VARCHAR(65) NOT NULL,
    `prenom_gerant` VARCHAR(65) NOT NULL,
    `id_op` INT NOT NULL,
    `id_cloc` INT NOT NULL,
    `matricule` VARCHAR(65) NOT NULL,
    PRIMARY KEY(`id_gerant`),
    FOREIGN KEY(`id_op`) REFERENCES `operation`(`id_operation`),
    FOREIGN KEY(`id_cloc`) REFERENCES `cloture`(`id_cloture`)
); 
/* Requêtes sql de création de la table details annulation */

CREATE TABLE IF NOT EXISTS `details_annulation`
(
    `id_details_annulation` INT NOT NULL AUTO_INCREMENT,
    `date_annulation` DATE,
    `id_ope` INT NOT NULL,
    `id_ger` INT NOT NULL,
    `motif` VARCHAR(65) NOT NULL,
    PRIMARY KEY(`id_details_annulation`),
    FOREIGN KEY(`id_ope`) REFERENCES `operation`(`id_operation`),
    FOREIGN KEY(`id_ger`) REFERENCES `cloture`(`id_gerant`)
); 

/* Requêtes sql de création de la table decaissement */

CREATE TABLE IF NOT EXISTS `decaissement`
(
    `id_decaissement` INT NOT NULL AUTO_INCREMENT,
    `id_operation` INT NOT NULL,
    `date_operation` DATE,
    `montant_operation` VARCHAR(65) NOT NULL,
    `etat` BOOLEAN,
    `motif` VARCHAR(65) NOT NULL,
    PRIMARY KEY(`id_decaissement`),
    FOREIGN KEY(`id_operation`) REFERENCES `operation`(`id_operation`)
);

/* Requêtes sql de création de la table encaissement */

CREATE TABLE IF NOT EXISTS `encaissement`
(
    `id_encaissement` INT NOT NULL AUTO_INCREMENT,
    `id_operation` INT NOT NULL,
    `date_operation` DATE,
    `montant_operation` VARCHAR(65) NOT NULL,
    `etat` BOOLEAN,
    `type_encaissement` VARCHAR(65) NOT NULL,
    PRIMARY KEY(`id_encaissement`),
    FOREIGN KEY(`id_operation`) REFERENCES `operation`(`id_operation`)
);

/* Requêtes sql de création de la table commission  */

CREATE TABLE IF NOT EXISTS `commission`
(
    `id_commission` INT NOT NULL AUTO_INCREMENT,
    `pourcentange` VARCHAR(65) NOT NULL,
    `id_enc` INT NOT NULL,
    PRIMARY KEY(`id_commission`),
    FOREIGN KEY(`id_enc`) REFERENCES `encaissement`(`id_encaissement`)
); 

/* Requêtes sql de création de la table autre montant à recerser   */

CREATE TABLE IF NOT EXISTS `autre_montant`
(
    `id_autre_montant` INT NOT NULL AUTO_INCREMENT,
    `montant` VARCHAR(65) NOT NULL,
    `id_dec` INT NOT NULL,
    PRIMARY KEY(`id_autre_montant`),
    FOREIGN KEY(`id_dec`) REFERENCES `decaissement`(`id_decaissement`)
); 

/* Requêtes sql de création de la table bon de sortie   */

CREATE TABLE IF NOT EXISTS `bon_de_sortie`
(
    `id_bon_de_sortie` INT NOT NULL AUTO_INCREMENT,
    `code_facture` VARCHAR(65) NOT NULL,
    `num_facture` VARCHAR(65) NOT NULL,
    `libelle` VARCHAR(65) NOT NULL,
    `id_dec` INT NOT NULL,
    PRIMARY KEY(`id_bon_de_sortie`),
    FOREIGN KEY(`id_dec`) REFERENCES `decaissement`(`id_decaissement`)
); 

/* Requêtes sql de création de la table bénéficiare  */

CREATE TABLE IF NOT EXISTS `beneficiare`
(
    `id_beneficiare` INT NOT NULL AUTO_INCREMENT,
    `nom_beneficiare` VARCHAR(65) NOT NULL,
    `prenom_beneficiare` VARCHAR(65) NOT NULL,
    `contact` VARCHAR(65) NOT NULL,
    `id_bon` INT NOT NULL,
    PRIMARY KEY(`id_beneficiare`),
    FOREIGN KEY(`id_bon`) REFERENCES `bon_de_sortie`(`id_bon_de_sortie`)
); 

/* Requêtes sql de création de la table qualité  */

CREATE TABLE IF NOT EXISTS `qualite`
(
    `id_qualite` INT NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(65) NOT NULL,
    `id_ben` INT NOT NULL,
    PRIMARY KEY(`id_qualite`),
    FOREIGN KEY(`id_ben`) REFERENCES `beneficiare`(`id_beneficiare`)
); 