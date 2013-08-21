
/* Drop Tables */

DROP TABLE IF EXISTS PERFIL_ACESSO_USUARIO;
DROP TABLE IF EXISTS USUARIO;
DROP TABLE IF EXISTS CIDADE;
DROP TABLE IF EXISTS DEPARTAMENTO;
DROP TABLE IF EXISTS UF;
DROP TABLE IF EXISTS PAIS;
DROP TABLE IF EXISTS PERFIL_ACESSO;




/* Create Tables */

CREATE TABLE CIDADE
(
	ID SERIAL NOT NULL UNIQUE,
	NOME VARCHAR(100) NOT NULL,
	ID_UF INT NOT NULL,
	STATUS_TUPLA BIT(1) DEFAULT '1' NOT NULL,
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE DEPARTAMENTO
(
	ID SERIAL NOT NULL,
	NOME VARCHAR(100) NOT NULL UNIQUE,
	SIGLA VARCHAR(20) UNIQUE,
	ID_SUBORDINADO_A INT,
	STATUS_TUPLA BIT VARYING DEFAULT '1' NOT NULL,
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE PAIS
(
	ID SERIAL NOT NULL UNIQUE,
	NOME VARCHAR(100) NOT NULL UNIQUE,
	STATUS_TUPLA BIT(1) DEFAULT '1' NOT NULL,
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE PERFIL_ACESSO
(
	ID SERIAL NOT NULL UNIQUE,
	NOME VARCHAR(100) NOT NULL UNIQUE,
	SYSNAME VARCHAR(20) NOT NULL UNIQUE,
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE PERFIL_ACESSO_USUARIO
(
	ID SERIAL NOT NULL UNIQUE,
	ID_USUARIO INT NOT NULL,
	ID_PERFIL_ACESSO INT NOT NULL,
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE UF
(
	ID SERIAL NOT NULL UNIQUE,
	SIGLA VARCHAR(2) NOT NULL UNIQUE,
	NOME VARCHAR(100) NOT NULL UNIQUE,
	ID_PAIS INT NOT NULL,
	STATUS_TUPLA BIT(1) DEFAULT '1' NOT NULL,
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE USUARIO
(
	ID SERIAL NOT NULL UNIQUE,
	LOGIN VARCHAR(30) NOT NULL UNIQUE,
	SENHA VARCHAR(128) NOT NULL,
	NOME VARCHAR(100) NOT NULL,
	SOBRENOME VARCHAR(100) NOT NULL,
	CARGO VARCHAR(100),
	ENDERECO VARCHAR(512),
	NUMERO VARCHAR(10),
	COMPLEMENTO VARCHAR(100),
	BAIRRO VARCHAR(100),
	CEP VARCHAR(10),
	TELEFONE VARCHAR(14) NOT NULL,
	EMAIL VARCHAR(100) NOT NULL,
	ID_PAIS INT,
	ID_UF INT,
	ID_CIDADE INT,
	ID_DEPARTAMENTO INT,
	STATUS_TUPLA BIT(1) DEFAULT '1' NOT NULL,
	PRIMARY KEY (ID)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE USUARIO
	ADD FOREIGN KEY (ID_CIDADE)
	REFERENCES CIDADE (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DEPARTAMENTO
	ADD FOREIGN KEY (ID_SUBORDINADO_A)
	REFERENCES DEPARTAMENTO (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USUARIO
	ADD FOREIGN KEY (ID_DEPARTAMENTO)
	REFERENCES DEPARTAMENTO (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE UF
	ADD FOREIGN KEY (ID_PAIS)
	REFERENCES PAIS (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USUARIO
	ADD FOREIGN KEY (ID_PAIS)
	REFERENCES PAIS (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE PERFIL_ACESSO_USUARIO
	ADD FOREIGN KEY (ID_PERFIL_ACESSO)
	REFERENCES PERFIL_ACESSO (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE CIDADE
	ADD FOREIGN KEY (ID_UF)
	REFERENCES UF (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USUARIO
	ADD FOREIGN KEY (ID_UF)
	REFERENCES UF (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE PERFIL_ACESSO_USUARIO
	ADD FOREIGN KEY (ID_USUARIO)
	REFERENCES USUARIO (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



