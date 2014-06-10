# Projet BD50 Compagnie A�rienne

## Se connecter au projet

	connect G17_FLIGHT/G17_FLIGHT

Connect�.

## Initilisation

### Creation du compte Oracle

#### 1. Se connecter en temp que syst�me manager

	connect system/manager

Connect�.

#### 2. Creer les tablespace necessaire pour le projet

creer les ficher E:\BD50\projet\FLIGHT_DATA.dbf

	create tablespace FLIGHT_DATA
	datafile'E:\BD50\projet\FLIGHT_DATA.dbf'
	SIZE 5M REUSE
	EXTENT MANAGEMENT LOCAL SEGMENT
	SPACE MANAGEMENT AUTO;

tablespace cr��

	create temporary tablespace FLIGHT_TEMP
	tempfile 'E:\ORACLE\oradata\prod\FLIGHT_TEMP.dbf'
	size 5M
	EXTENT MANAGEMENT LOCAL;

tablespace cr��

#### 3. Creer un compte oracle pour le projet

	Create user G17_FLIGHT 
	Identified by G17_FLIGHT 
	default tablespace FLIGHT_DATA
	temporary tablespace FLIGHT_TEMP;

Utilisateur cr��.

#### 4. Definir les droits

	Grant connect, resource, plustrace
	, create view, create synonym, create user, alter user
	, xdbadmin
	to G17_FLIGHT with admin option;

Autorisation de privil�ges (GRANT) accept�e.

	grant connect, resource to G17_FLIGHT;

Autorisation de privil�ges (GRANT) accept�e.


#### 5. Verification de la connection

	connect G17_FLIGHT/G17_FLIGHT

Connect�.	

### Importer les table

	@...\COMPAGNIE_AERIENNE.SQL
