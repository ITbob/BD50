-- -----------------------------------------------------------------------------
--       TABLE : AEROPORT
-- -----------------------------------------------------------------------------

CREATE TABLE AEROPORT
   (
    CODE_AERO VARCHAR2(50)  NOT NULL,
    PAYS VARCHAR2(50) NULL,
    VILLE VARCHAR2(50) NULL,
    NOM_AERO VARCHAR2(50) NULL
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : BILLET
-- -----------------------------------------------------------------------------

CREATE TABLE BILLET
   (
    NUME_BILL NUMBER(5)  NOT NULL,
    NUME_PASS_CLI CHAR(9)  NOT NULL,
    PRIX_TOTA_HT NUMBER(13,2)  NOT NULL,
    DATE_BILL DATE  NOT NULL
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : PROMOTION
-- -----------------------------------------------------------------------------

CREATE TABLE PROMOTION
   (
    CODE_PROM NUMBER(5)  NOT NULL,
    POUR_PROM NUMBER(2)  NULL,
    REDU_BRUT NUMBER(13,2)  NULL
   ) ;


-- -----------------------------------------------------------------------------
--       TABLE : EQUIPAGE
-- -----------------------------------------------------------------------------

CREATE TABLE EQUIPAGE
   (
    ID_EQUIPE NUMBER(5)  NOT NULL,
    DATE_CREA DATE  NOT NULL
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
   ) ;

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
   ) ;

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
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : AVION
-- -----------------------------------------------------------------------------

CREATE TABLE AVION
   (
    ID_AVION NUMBER(5)  NOT NULL,
    NOMB_HEUR_VOL NUMBER(8)  NOT NULL,
    NOMB_REVI NUMBER(8)  NOT NULL,
    PLACE_STAN NUMBER(2)  NOT NULL,
    PLACE_BUIS NUMBER(2)  NOT NULL
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : CLASSE
-- -----------------------------------------------------------------------------

CREATE TABLE CLASSE
   (
    ID_CLASS NUMBER(5)  NOT NULL,
    NOM_CLASS VARCHAR2(50)  NOT NULL
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : TERMINAL
-- -----------------------------------------------------------------------------

CREATE TABLE TERMINAL
   (
    TERMINAL VARCHAR2(50)  NOT NULL,
    PORTE VARCHAR2(50)  NOT NULL,
    CODE_AERO VARCHAR2(50)  NOT NULL
   ) ;

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
   ) ;

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
   ) ;


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
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : SPECIALITE
-- -----------------------------------------------------------------------------

CREATE TABLE SPECIALITE
   (
    ID_SPEC NUMBER(5)  NOT NULL,
    LIBE_SPEC VARCHAR2(100)  NOT NULL
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
   )PARTITION BY RANGE (DATE_DEPART)(
partition p_2014 values less than (to_date('2015-01-01','YYYY-MM-DD'))
)
tablespace FLIGHT_DATA  ;

-- -----------------------------------------------------------------------------
--       TABLE : RECEVOIR
-- -----------------------------------------------------------------------------

CREATE TABLE RECEVOIR
   (
    ID_VOL NUMBER(5)  NOT NULL,
    CODE_PROM NUMBER(5)  NOT NULL
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : ASSIGNER_A
-- -----------------------------------------------------------------------------

CREATE TABLE ASSIGNER_A
   (
    NUME_BILL NUMBER(5)  NOT NULL,
    NUM_PASS NUMBER(6)  NOT NULL
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : CONCERNER
-- -----------------------------------------------------------------------------

CREATE TABLE CONCERNER
   (
    CODE_RESE NUMBER(5)  NOT NULL,
    NUM_PASS NUMBER(6)  NOT NULL
   ) ;