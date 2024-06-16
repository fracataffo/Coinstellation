CREATE SCHEMA IF NOT EXISTS `CoinstellationDB`;

USE `CoinstellationDB`;


CREATE TABLE Amministratore (
	`id` INT NOT NULL,
	`nome` VARCHAR(80) NOT NULL,
	`cognome` VARCHAR(80) NOT NULL,
	`email` VARCHAR(80) NOT NULL,
	`password` VARCHAR(80) NOT NULL,
	`cellulare` VARCHAR(14),
	PRIMARY KEY (`id`)
);

CREATE TABLE Cliente (
	`id` INT NOT NULL,
	`nome` VARCHAR(80) NOT NULL,
	`cognome` VARCHAR(80) NOT NULL,
	`email` VARCHAR(80) NOT NULL,
	`password` VARCHAR(80) NOT NULL,
	`cellulare` VARCHAR(14),
	PRIMARY KEY (`id`)
);

CREATE TABLE Indirizzo (
	`id` INT NOT NULL,
	`num_civico` VARCHAR(5) NOT NULL,
	`via` VARCHAR(80) NOT NULL,
	`codice_postale` CHAR(5) NOT NULL,
	`città` VARCHAR(80) NOT NULL,
	`provincia` VARCHAR(80) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE Cliente_Indirizzo (
	`cliente` INT NOT NULL,
	`indirizzo` INT NOT NULL,
	PRIMARY KEY (`cliente`, `indirizzo`),
	CONSTRAINT `fk_cliente_indirizzo_1`
		FOREIGN KEY (`cliente`)
		REFERENCES `Cliente` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
    CONSTRAINT `fk_cliente_indirizzo_2`
		FOREIGN KEY (`indirizzo`)
		REFERENCES `Indirizzo` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);


CREATE TABLE Metodo_Pagamento (
	`id` INT NOT NULL,
	`nome` VARCHAR(80) NOT NULL,
	`cognome` VARCHAR(80) NOT NULL,
	`tipo` ENUM('carta di credito', 'conto corrente') NOT NULL,
	`num_carta` CHAR(16) UNIQUE,
	`data_scadenza` DATE,
	`iban` CHAR(27) UNIQUE,
	`codice_bic` VARCHAR(11),
	PRIMARY KEY (`id`)
);

CREATE TABLE Proprietà (
	`cliente` INT NOT NULL,
	`metodo_pagamento` INT NOT NULL,
	PRIMARY KEY (`cliente`, `metodo_pagamento`),
	CONSTRAINT `fk_proprietà_1`
		FOREIGN KEY (`cliente`)
		REFERENCES `Cliente` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT `fk_proprietà_2`
		FOREIGN KEY (`metodo_pagamento`)
		REFERENCES `Metodo_Pagamento` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);

CREATE TABLE Iva (
	`id` INT NOT NULL,
	`valore` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE Ordine (
	`id` INT NOT NULL,
	`data_ordine` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`indirizzo_consegna` INT NOT NULL,
	`data_consegna` DATE NOT NULL,
	`data_consegnato` TIMESTAMP,
	`cliente` INT NOT NULL,
	`costo_spedizione` INT NOT NULL,
	`costo_complessivo` INT NOT NULL,
	`iva` INT NOT NULL,
	`metodo_pagamento` INT NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `fk_ordine_1`
		FOREIGN KEY (`cliente`)
		REFERENCES `Cliente` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT `fk_ordine_2`
		FOREIGN KEY (`iva`)
		REFERENCES `Iva` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT `fk_ordine_3`
		FOREIGN KEY (`metodo_pagamento`)
		REFERENCES `Metodo_Pagamento` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT `fk_ordine_4`
		FOREIGN KEY (`indirizzo_consegna`)
		REFERENCES `Indirizzo` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
	--CHECK data_consegna <= data_consegnato
);


CREATE TABLE Prodotto (
	`id` INT NOT NULL,
	`nome` VARCHAR(80) NOT NULL,
	`tipo` ENUM('moneta', 'banconota') NOT NULL,
	`valore_nominale` INT NOT NULL,
	`anno` CHAR(4) NOT NULL,
	`nazione` VARCHAR(80) NOT NULL,
	`descrizione` TEXT,
	`disponibile` BOOLEAN NOT NULL,
	`prezzo` INT,
	PRIMARY KEY (`id`)
);

CREATE TABLE Carrello (
	`cliente` INT NOT NULL,
	`prodotto` INT NOT NULL,
	`unità` INT NOT NULL,
	PRIMARY KEY (`cliente`, `prodotto`),
	CONSTRAINT `fk_carrello_1`
		FOREIGN KEY (`cliente`)
		REFERENCES `Cliente` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT `fk_carrello_2`
		FOREIGN KEY (`prodotto`)
		REFERENCES `Prodotto` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);

CREATE TABLE Versione_Prodotto (
	`prodotto` INT NOT NULL,
	`versione` INT NOT NULL,
	`prezzo` INT NOT NULL,
	PRIMARY KEY (`prodotto`, `versione`),
	CONSTRAINT `fk_versione_prodotto`
		FOREIGN KEY (`prodotto`)
		REFERENCES `Prodotto` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);

CREATE TABLE Composizione (
	`prodotto` INT NOT NULL,
	`versione` INT NOT NULL,
	`ordine` INT NOT NULL,
	`unità` INT NOT NULL,
	PRIMARY KEY (`prodotto`, `ordine`),
	CONSTRAINT `fk_composizione_1`
		FOREIGN KEY (`prodotto`, `versione`)
		REFERENCES `Versione_Prodotto` (`prodotto`, `versione`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT `fk_composizione_2`
		FOREIGN KEY (`ordine`)
		REFERENCES `Ordine` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);

