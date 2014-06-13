# Initialisation du projet

## Se connecter au projet

	connect G17_FLIGHT/G17_FLIGHT

Connecté.

## Initilisation

### Creation du compte Oracle

#### 1. Se connecter en temp que système manager

	connect system/manager

Connecté.

#### 2 importer config_xmldb

	alter system set local_listener="(ADDRESS=(PROTOCOL=TCP)(HOST=XPSQL)(PORT=1521))" scope = both;

Système modifié.
	
	exec dbms_xdb.setftpport(2100);

Procédure PL/SQL terminée avec succès.
	
	exec dbms_xdb.sethttpport(8080);

Procédure PL/SQL terminée avec succès.
	
	alter system register;

Système modifié.


#### 3. Creer les tablespace necessaire pour le projet

creer les ficher E:\BD50\projet\FLIGHT_DATA.dbf

	create tablespace FLIGHT_DATA
	datafile'E:\BD50\projet\FLIGHT_DATA.dbf'
	SIZE 5M REUSE
	EXTENT MANAGEMENT LOCAL SEGMENT
	SPACE MANAGEMENT AUTO;

tablespace créé

	create temporary tablespace FLIGHT_TEMP
	tempfile 'E:\ORACLE\oradata\prod\FLIGHT_TEMP.dbf'
	size 5M
	EXTENT MANAGEMENT LOCAL;

tablespace créé

#### 4. Creer un compte oracle pour le projet

	Create user G17_FLIGHT 
	Identified by G17_FLIGHT 
	default tablespace FLIGHT_DATA
	temporary tablespace FLIGHT_TEMP;

Utilisateur créé.

#### 5. Definir les droits

	Grant connect, resource, plustrace
	, create view, create synonym, create user, alter user
	, xdbadmin
	to G17_FLIGHT with admin option;

Autorisation de privilèges (GRANT) acceptée.

	grant xdbadmin to G17_FLIGHT

Autorisation de privilèges (GRANT) acceptée.

	grant connect, resource to G17_FLIGHT;

Autorisation de privilèges (GRANT) acceptée.


#### 6. Verification de la connection

	connect G17_FLIGHT/G17_FLIGHT

Connecté.	

### Importer les table

	@...\FLIGHT.SQL

### creation du dad

	@...\DB\dad_create.sql

Procédure PL/SQL terminée avec succès.

Procédure PL/SQL terminèe avec succès.

	@...\DB\dad_check.sql

Procédure créée.

aller sur le lien http://xpsql:8080/flight/home pour tester le bon fonctionement du système