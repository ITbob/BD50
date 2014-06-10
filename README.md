# Projet BD50 Compagnie Aérienne

## Se connecter au projet

	connect G17_FLIGHT/G17_FLIGHT

## Initilisation

### Creation du compte Oracle

#### 1. Se connecter en temp que système manager

	connect system/manager

#### 2. Creer les tablespace necessaire pour le projet

	create tablespace FLIGHT_DATA
	datafile'F:\BD51\projet\FLIGHT_DATA.dbf'
	SIZE 5M REUSE
	EXTENT MANAGEMENT LOCAL SEGMENT
	SPACE MANAGEMENT AUTO;

	create temporary tablespace FLIGHT_TEMP
	tempfile 'E:\ORACLE\oradata\prod\FLIGHT_TEMP.dbf'
	size 5M
	EXTENT MANAGEMENT LOCAL;

#### 3. Creer un compte oracle pour le projet

	Create user G17_FLIGHT 
	Identified by G17_FLIGHT 
	default tablespace FLIGHT_DATA
	temporary tablespace FLIGHT_TEMP;

#### 4. Definir les droits

	Grant connect, resource, plustrace
	, create view, create synonym, create user, alter user
	, xdbadmin
	to G17_FLIGHT with admin option;

	grant execute on dbms_epg to G17_FLIGHT with grant option;

#### 5. Verification de la connection

	connect G17_FLIGHT/G17_FLIGHT	

### Importer les table

	@...\COMPAGNIE_AERIENNE.SQL
