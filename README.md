# Se connecter au projet

connect G17_FLIGHT/G17_FLIGHT

# Creation du compte Oracle

## 1. Se connecter en temp que système manager

connect system/manager

## 2. Creer un compte oracle pour le projet

Create user G17_FLIGHT
Identified by G17_FLIGHT
default tablespace USERS
temporary tablespace TEMP;

## 3. Definir les droits

Grant connect, resource, plustrace
, create view, create synonym, create user, alter user
, xdbadmin
to G17_FLIGHT with admin option;

grant execute on dbms_epg to G17_FLIGHT with grant option;

## 4. Verification de la connection

connect G17_FLIGHT/G17_FLIGHT	

	