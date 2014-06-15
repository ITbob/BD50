-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE BILLET
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_BILLET_CLIENT
     ON BILLET (NUME_PASS_CLI ASC)
    ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EMPLOYE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EMPLOYE_EQUIPAGE
     ON EMPLOYE (ID_EQUIPE ASC)
    ;

CREATE  INDEX I_FK_EMPLOYE_SPECIALITE
     ON EMPLOYE (ID_SPEC ASC)
    ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE TERMINAL
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_TERMINAL_AEROPORT
     ON TERMINAL (CODE_AERO ASC)
    ;

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
--       INDEX DE LA TABLE RESERVATION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RESERVATION_CLIENT
     ON RESERVATION (NUME_PASS_CLI ASC)
    ;

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

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RECEVOIR
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RECEVOIR_PROMOTION
     ON RECEVOIR (CODE_PROM ASC)
    ;

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
--       INDEX DE LA TABLE CONCERNER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CONCERNER_RESERVATION
     ON CONCERNER (CODE_RESE ASC)
    ;

CREATE  INDEX I_FK_CONCERNER_PASSAGER
     ON CONCERNER (NUM_PASS ASC)
    ;
-- -----------------------------------------------------------------------------
--       CREATION DES FK
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
