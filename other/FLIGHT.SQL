-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                      Oracle Version 10g
--                        (10/6/2014 10:58:49)
-- -----------------------------------------------------------------------------
--      Nom de la base : compagnie_aerienne
--      Projet : Espace de travail
--      Auteur : etudiant
--      Date de dernière modification : 10/6/2014 10:47:01
-- -----------------------------------------------------------------------------

DROP TABLE AEROPORT CASCADE CONSTRAINTS;

DROP TABLE BILLET CASCADE CONSTRAINTS;

DROP TABLE PROMOTION CASCADE CONSTRAINTS;

DROP TABLE EQUIPAGE CASCADE CONSTRAINTS;

DROP TABLE PASSAGER CASCADE CONSTRAINTS;

DROP TABLE EMPLOYE CASCADE CONSTRAINTS;

DROP TABLE CLIENT CASCADE CONSTRAINTS;

DROP TABLE AVION CASCADE CONSTRAINTS;

DROP TABLE CLASSE CASCADE CONSTRAINTS;

DROP TABLE TERMINAL CASCADE CONSTRAINTS;

DROP TABLE VOL_COMM CASCADE CONSTRAINTS;

DROP TABLE RESERVATION CASCADE CONSTRAINTS;

DROP TABLE PLACE CASCADE CONSTRAINTS;

DROP TABLE SPECIALITE CASCADE CONSTRAINTS;

DROP TABLE VOL_REEL CASCADE CONSTRAINTS;

DROP TABLE RECEVOIR CASCADE CONSTRAINTS;

DROP TABLE ASSIGNER_A CASCADE CONSTRAINTS;

DROP TABLE CONCERNER CASCADE CONSTRAINTS;


-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE compagnie_aerienne;

-- -----------------------------------------------------------------------------
--       TABLE : AEROPORT
-- -----------------------------------------------------------------------------

CREATE TABLE AEROPORT
   (
    CODE_AERO VARCHAR2(50)  NOT NULL,
    PAYS VARCHAR2(50)  NULL,
    VILLE VARCHAR2(50)  NULL,
    NOM_AERO VARCHAR2(50)  NULL
,   CONSTRAINT PK_AEROPORT PRIMARY KEY (CODE_AERO)  
   ) ;

--CREATE INDEX AEROPORT_INDEX ON AEROPORT(PAYS,VILLE);

-- -----------------------------------------------------------------------------
--       TABLE : BILLET
-- -----------------------------------------------------------------------------

CREATE TABLE BILLET
   (
    NUME_BILL NUMBER(5)  NOT NULL,
    NUME_PASS_CLI CHAR(9)  NOT NULL,
    PRIX_TOTA_HT NUMBER(13,2)  NOT NULL,
    DATE_BILL DATE  NOT NULL
,   CONSTRAINT PK_BILLET PRIMARY KEY (NUME_BILL)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE BILLET
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_BILLET_CLIENT
     ON BILLET (NUME_PASS_CLI ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : PROMOTION
-- -----------------------------------------------------------------------------

CREATE TABLE PROMOTION
   (
    CODE_PROM NUMBER(5)  NOT NULL,
    POUR_PROM NUMBER(2)  NULL,
    REDU_BRUT NUMBER(13,2)  NULL
,   CONSTRAINT PK_PROMOTION PRIMARY KEY (CODE_PROM)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : EQUIPAGE
-- -----------------------------------------------------------------------------

CREATE TABLE EQUIPAGE
   (
    ID_EQUIPE NUMBER(5)  NOT NULL,
    DATE_CREA DATE  NOT NULL
,   CONSTRAINT PK_EQUIPAGE PRIMARY KEY (ID_EQUIPE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : PASSAGER
-- -----------------------------------------------------------------------------

CREATE TABLE PASSAGER
   (
    NUM_PASS NUMBER(6)  NOT NULL,
    NOM_PASS VARCHAR2(50)  NOT NULL,
    PRENOM_PASS VARCHAR2(50)  NOT NULL,
    NUM_PASSEPORT_PASS CHAR(9)  NULL,
    NUM_IDEN_PASS NUMBER(12)  NULL
,   CONSTRAINT PK_PASSAGER PRIMARY KEY (NUM_PASS)  
   ) ;

CREATE INDEX PASSAGER_INDEX ON PASSAGER(NOM_PASS,PRENOM_PASS);

-- -----------------------------------------------------------------------------
--       TABLE : EMPLOYE
-- -----------------------------------------------------------------------------

CREATE TABLE EMPLOYE
   (
    NUME_PASS_EMPL CHAR(9)  NOT NULL,
    ID_EQUIPE NUMBER(5)  NULL,
    ID_SPEC NUMBER(5)  NOT NULL,
    NOM_EMPL VARCHAR2(50)  NOT NULL,
    PREN_EMPL VARCHAR2(50)  NOT NULL,
    NUME_ADRE_EMPL NUMBER(4)  NULL,
    NOM_ADRE_EMPL VARCHAR2(100)  NULL,
    CODE_POST_EMPL NUMBER(5)  NULL,
    VILL_EMPL VARCHAR2(50)  NULL,
    NUME_TELE_EMPL NUMBER(10)  NOT NULL,
    EMAI_EMPL VARCHAR2(100)  NULL,
    NOMB_HEUR_EMPL NUMBER(4)  NOT NULL
,   CONSTRAINT PK_EMPLOYE PRIMARY KEY (NUME_PASS_EMPL)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EMPLOYE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EMPLOYE_EQUIPAGE
     ON EMPLOYE (ID_EQUIPE ASC)
    ;

CREATE  INDEX I_FK_EMPLOYE_SPECIALITE
     ON EMPLOYE (ID_SPEC ASC)
    ;

CREATE INDEX EMPLOYE_INDEX ON EMPLOYE(NOM_EMPL,PREN_EMPL);

-- -----------------------------------------------------------------------------
--       TABLE : CLIENT
-- -----------------------------------------------------------------------------

CREATE TABLE CLIENT
   (
    NUME_PASS_CLI CHAR(9)  NOT NULL,
    NOM_CLI VARCHAR2(50)  NOT NULL,
    PREN_CLI VARCHAR2(50)  NOT NULL,
    PASSWORD_CLI VARCHAR2(50)  NOT NULL,
    NUM_RUE_CLI NUMBER(4)  NULL,
    NOM_RUE_CLI VARCHAR2(100)  NULL,
    CODE_POST_CLI NUMBER(5)  NULL,
    VILL_CLI VARCHAR2(50)  NULL,
    TELE_CLI NUMBER(10)  NOT NULL,
    EMAI_CLI VARCHAR2(100)  NOT NULL
,   CONSTRAINT PK_CLIENT PRIMARY KEY (NUME_PASS_CLI)  
   ) ;

CREATE INDEX CLIENT_INDEX ON CLIENT(NOM_CLI,PREN_CLI);

-- -----------------------------------------------------------------------------
--       TABLE : AVION
-- -----------------------------------------------------------------------------

CREATE TABLE AVION
   (
    ID_AVION NUMBER(5)  NOT NULL,
    NOMB_HEUR_VOL NUMBER(8)  NOT NULL,
    NOMB_REVI NUMBER(8)  NOT NULL,
    PLACE_STAN NUMBER(2)  NOT NULL,
    PLACE_BUIS NUMBER(2)  NOT NULL,
    CONSTRAINT PK_AVION PRIMARY KEY (ID_AVION)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : CLASSE
-- -----------------------------------------------------------------------------

CREATE TABLE CLASSE
   (
    ID_CLASS NUMBER(5)  NOT NULL,
    NOM_CLASS VARCHAR2(50)  NOT NULL
,   CONSTRAINT PK_CLASSE PRIMARY KEY (ID_CLASS)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : TERMINAL
-- -----------------------------------------------------------------------------

CREATE TABLE TERMINAL
   (
    TERMINAL VARCHAR2(50)  NOT NULL,
    PORTE VARCHAR2(50)  NOT NULL,
    CODE_AERO VARCHAR2(50)  NOT NULL,
    CONSTRAINT PK_TERMINAL PRIMARY KEY (TERMINAL, PORTE, CODE_AERO)
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE TERMINAL
-- -----------------------------------------------------------------------------

-- CREATE  INDEX I_FK_TERMINAL_AEROPORT
--     ON TERMINAL (CODE_AERO ASC)
--    ;

-- -----------------------------------------------------------------------------
--       TABLE : VOL_COMM
-- -----------------------------------------------------------------------------

CREATE TABLE VOL_COMM
   (
    ID_VOL_COMM CHAR(32)  NOT NULL,
    CODE_AERO_ATTERRIR VARCHAR2(50)  NOT NULL,
    CODE_AERO_DECOLLER VARCHAR2(50)  NOT NULL,
    JOUR_SEMA NUMBER(1)  NOT NULL,
    HORA_VOL_COMM NUMBER(4)  NOT NULL,
    DURE_VOL_COMM NUMBER(4)  NOT NULL,
    DATE_DEBU_VALI DATE  NOT NULL,
    DATE_FIN_VALI DATE  NULL
,   CONSTRAINT PK_VOL_COMM PRIMARY KEY (ID_VOL_COMM)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE VOL_COMM
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_VOL_COMM_AEROPORT
     ON VOL_COMM (CODE_AERO_ATTERRIR ASC)
    ;

CREATE  INDEX I_FK_VOL_COMM_AEROPORT2
     ON VOL_COMM (CODE_AERO_DECOLLER ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : RESERVATION
-- -----------------------------------------------------------------------------

CREATE TABLE RESERVATION
   (
    CODE_RESE NUMBER(5)  NOT NULL,
    NUME_PASS_CLI CHAR(9)  NOT NULL,
    DATE_LIMI DATE  NOT NULL,
    DATE_RESE DATE  NOT NULL,
    ETAT_RESE CHAR(32)  NOT NULL
,   CONSTRAINT PK_RESERVATION PRIMARY KEY (CODE_RESE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RESERVATION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RESERVATION_CLIENT
     ON RESERVATION (NUME_PASS_CLI ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : PLACE
-- -----------------------------------------------------------------------------

CREATE TABLE PLACE
   (
    ID_VOL NUMBER(5)  NOT NULL,
    NUME_RANG NUMBER(2)  NOT NULL,
    NUME_LIGN NUMBER(2)  NOT NULL,
    NUME_BILL NUMBER(5)  ,
    CODE_RESE NUMBER(5) ,
    ID_CLASS NUMBER(5)  NOT NULL,
    ETAT_PLAC CHAR(1)  NOT NULL,
    ENRGISTREMENT NUMBER(1)  NOT NULL,
    PRIX_PASSA NUMBER(13,2)  NOT NULL
,   CONSTRAINT PK_PLACE PRIMARY KEY (ID_VOL, NUME_RANG, NUME_LIGN)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PLACE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_PLACE_BILLET
     ON PLACE (NUME_BILL ASC)
    ;

CREATE  INDEX I_FK_PLACE_RESERVATION
     ON PLACE (CODE_RESE ASC)
    ;

CREATE  INDEX I_FK_PLACE_CLASSE
     ON PLACE (ID_CLASS ASC)
    ;

CREATE  INDEX I_FK_PLACE_VOL_REEL
     ON PLACE (ID_VOL ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : SPECIALITE
-- -----------------------------------------------------------------------------

CREATE TABLE SPECIALITE
   (
    ID_SPEC NUMBER(5)  NOT NULL,
    LIBE_SPEC VARCHAR2(100)  NOT NULL
,   CONSTRAINT PK_SPECIALITE PRIMARY KEY (ID_SPEC)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : VOL_REEL
-- -----------------------------------------------------------------------------

CREATE TABLE VOL_REEL
   (
    ID_VOL NUMBER(5)  NOT NULL,
    ID_EQUIPE NUMBER(5)  NOT NULL,
    ID_VOL_COMM CHAR(32)  NOT NULL,
    ID_AVION NUMBER(5)  NOT NULL,
    TERMINAL_ATTERRIR VARCHAR2(50)  NOT NULL,
    PORTE_ATTERRIR VARCHAR2(50)  NOT NULL,
    CODE_AERO_ATTERRIR VARCHAR2(50)  NOT NULL,
    TERMINAL_DECOLLER VARCHAR2(50)  NOT NULL,
    PORTE_DECOLLER VARCHAR2(50)  NOT NULL,
    CODE_AERO_DECOLLER VARCHAR2(50)  NOT NULL,
    DATE_DEPART DATE NOT NULL,
    JOUR_VOL AS (to_number(to_char(DATE_DEPART,'DD'))),
    MOIS_VOL AS (to_number(to_char(DATE_DEPART,'MM'))),
    ANNE_VOL AS (to_number(to_char(DATE_DEPART,'YYYY'))),
    DUREE_VOL NUMBER(4) NOT NULL,
    PRIX_STAN NUMBER(13,2)  NOT NULL,
    ETAT_VOL CHAR(1)  NOT NULL
,   CONSTRAINT PK_VOL_REEL PRIMARY KEY (ID_VOL)  
   )PARTITION BY RANGE (DATE_DEPART)(
partition p_2014 values less than (to_date('2015-01-01','YYYY-MM-DD')),
partition p_2015 values less than (to_date('2016-01-01','YYYY-MM-DD')),
partition p_2016 values less than (to_date('2017-01-01','YYYY-MM-DD')),
partition p_2017 values less than (to_date('2018-01-01','YYYY-MM-DD'))
)
 tablespace FLIGHT_DATA ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE VOL_REEL
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_VOL_REEL_EQUIPAGE
     ON VOL_REEL (ID_EQUIPE ASC)
    ;

CREATE  INDEX I_FK_VOL_REEL_VOL_COMM
     ON VOL_REEL (ID_VOL_COMM ASC)
    ;

CREATE  INDEX I_FK_VOL_REEL_AVION
     ON VOL_REEL (ID_AVION ASC)
    ;

CREATE  INDEX I_FK_VOL_REEL_TERMINAL
     ON VOL_REEL (CODE_AERO_ATTERRIR ASC, TERMINAL_ATTERRIR ASC, PORTE_ATTERRIR ASC)
    ;

CREATE  INDEX I_FK_VOL_REEL_TERMINAL1
     ON VOL_REEL (CODE_AERO_DECOLLER ASC, TERMINAL_DECOLLER ASC, PORTE_DECOLLER ASC)
    ;

CREATE INDEX VOL_INDEX ON VOL_REEL(JOUR_VOL,MOIS_VOL,ANNE_VOL);


-- -----------------------------------------------------------------------------
--       TABLE : RECEVOIR
-- -----------------------------------------------------------------------------

CREATE TABLE RECEVOIR
   (
    ID_VOL NUMBER(5)  NOT NULL,
    CODE_PROM NUMBER(5)  NOT NULL
,   CONSTRAINT PK_RECEVOIR PRIMARY KEY (ID_VOL)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RECEVOIR
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RECEVOIR_PROMOTION
     ON RECEVOIR (CODE_PROM ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ASSIGNER_A
-- -----------------------------------------------------------------------------

CREATE TABLE ASSIGNER_A
   (
    NUME_BILL NUMBER(5)  NOT NULL,
    NUM_PASS NUMBER(6)  NOT NULL
,   CONSTRAINT PK_ASSIGNER_A PRIMARY KEY (NUME_BILL, NUM_PASS)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ASSIGNER_A
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ASSIGNER_A_BILLET
     ON ASSIGNER_A (NUME_BILL ASC)
    ;

CREATE  INDEX I_FK_ASSIGNER_A_PASSAGER
     ON ASSIGNER_A (NUM_PASS ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CONCERNER
-- -----------------------------------------------------------------------------

CREATE TABLE CONCERNER
   (
    CODE_RESE NUMBER(5)  NOT NULL,
    NUM_PASS NUMBER(6)  NOT NULL
,   CONSTRAINT CONCERNER PRIMARY KEY (CODE_RESE, NUM_PASS)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CONCERNER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CONCERNER_RESERVATION
     ON CONCERNER (CODE_RESE ASC)
    ;

CREATE  INDEX I_FK_CONCERNER_PASSAGER
     ON CONCERNER (NUM_PASS ASC)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE BILLET ADD (
     CONSTRAINT FK_BILLET_CLIENT
          FOREIGN KEY (NUME_PASS_CLI)
               REFERENCES CLIENT (NUME_PASS_CLI))   ;

ALTER TABLE EMPLOYE ADD (
     CONSTRAINT FK_EMPLOYE_EQUIPAGE
          FOREIGN KEY (ID_EQUIPE)
               REFERENCES EQUIPAGE (ID_EQUIPE))   ;

ALTER TABLE EMPLOYE ADD (
     CONSTRAINT FK_EMPLOYE_SPECIALITE
          FOREIGN KEY (ID_SPEC)
               REFERENCES SPECIALITE (ID_SPEC))   ;

 ALTER TABLE TERMINAL ADD (
     CONSTRAINT FK_TERMINAL_AEROPORT
          FOREIGN KEY (CODE_AERO)
               REFERENCES AEROPORT (CODE_AERO))   ;

ALTER TABLE VOL_COMM ADD (
     CONSTRAINT FK_VOL_COMM_AEROPORT
          FOREIGN KEY (CODE_AERO_ATTERRIR)
               REFERENCES AEROPORT (CODE_AERO))   ;

ALTER TABLE VOL_COMM ADD (
     CONSTRAINT FK_VOL_COMM_AEROPORT2
          FOREIGN KEY (CODE_AERO_DECOLLER)
               REFERENCES AEROPORT (CODE_AERO))   ;

ALTER TABLE RESERVATION ADD (
     CONSTRAINT FK_RESERVATION_CLIENT
          FOREIGN KEY (NUME_PASS_CLI)
               REFERENCES CLIENT (NUME_PASS_CLI))   ;


ALTER TABLE PLACE ADD (
     CONSTRAINT FK_PLACE_BILLET
          FOREIGN KEY (NUME_BILL)
               REFERENCES BILLET (NUME_BILL))   ;

ALTER TABLE PLACE ADD (
     CONSTRAINT FK_PLACE_RESERVATION
          FOREIGN KEY (CODE_RESE)
               REFERENCES RESERVATION (CODE_RESE))   ;

ALTER TABLE PLACE ADD (
     CONSTRAINT FK_PLACE_CLASSE
          FOREIGN KEY (ID_CLASS)
               REFERENCES CLASSE (ID_CLASS))   ;

ALTER TABLE PLACE ADD (
     CONSTRAINT FK_PLACE_VOL_REEL
          FOREIGN KEY (ID_VOL)
               REFERENCES VOL_REEL (ID_VOL))   ;

ALTER TABLE VOL_REEL ADD (
     CONSTRAINT FK_VOL_REEL_EQUIPAGE
          FOREIGN KEY (ID_EQUIPE)
               REFERENCES EQUIPAGE (ID_EQUIPE))   ;

ALTER TABLE VOL_REEL ADD (
     CONSTRAINT FK_VOL_REEL_VOL_COMM
          FOREIGN KEY (ID_VOL_COMM)
               REFERENCES VOL_COMM (ID_VOL_COMM))   ;

ALTER TABLE VOL_REEL ADD (
     CONSTRAINT FK_VOL_REEL_AVION
          FOREIGN KEY (ID_AVION)
               REFERENCES AVION (ID_AVION));

ALTER TABLE VOL_REEL ADD (
     CONSTRAINT FK_VOL_REEL_TERMINAL
          FOREIGN KEY (TERMINAL_ATTERRIR, PORTE_ATTERRIR,CODE_AERO_ATTERRIR)
               REFERENCES TERMINAL (TERMINAL, PORTE, CODE_AERO));

ALTER TABLE VOL_REEL ADD (
     CONSTRAINT FK_VOL_REEL_TERMINAL1
          FOREIGN KEY (TERMINAL_DECOLLER, PORTE_DECOLLER, CODE_AERO_DECOLLER)
               REFERENCES TERMINAL (TERMINAL, PORTE, CODE_AERO));

ALTER TABLE RECEVOIR ADD (
     CONSTRAINT FK_RECEVOIR_PROMOTION
          FOREIGN KEY (CODE_PROM)
               REFERENCES PROMOTION (CODE_PROM))   ;

ALTER TABLE RECEVOIR ADD (
     CONSTRAINT FK_RECEVOIR_VOL_REEL
          FOREIGN KEY (ID_VOL)
               REFERENCES VOL_REEL (ID_VOL))   ;

ALTER TABLE ASSIGNER_A ADD (
     CONSTRAINT FK_ASSIGNER_A_BILLET
          FOREIGN KEY (NUME_BILL)
               REFERENCES BILLET (NUME_BILL))   ;

ALTER TABLE ASSIGNER_A ADD (
     CONSTRAINT FK_ASSIGNER_A_PASSAGER
          FOREIGN KEY (NUM_PASS)
               REFERENCES PASSAGER (NUM_PASS))   ;

ALTER TABLE CONCERNER ADD (
     CONSTRAINT FK_CONCERNER_RESERVATION
          FOREIGN KEY (CODE_RESE)
               REFERENCES RESERVATION (CODE_RESE))   ;

ALTER TABLE CONCERNER ADD (
     CONSTRAINT FK_CONCERNER_PASSAGER
          FOREIGN KEY (NUM_PASS)
               REFERENCES PASSAGER (NUM_PASS))   ;


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------
