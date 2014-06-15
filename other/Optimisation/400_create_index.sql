-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE AEROPORT
-- -----------------------------------------------------------------------------

CREATE UNIQUE INDEX AEROPORT_INDEX ON AEROPORT(NOM_AERO);

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PASSAGER
-- -----------------------------------------------------------------------------

CREATE UNIQUE INDEX PASSAGER_INDEX ON PASSAGER(NOM_PASS,PRENOM_PASS);

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EMPLOYE
-- -----------------------------------------------------------------------------

CREATE UNIQUE INDEX EMPLOYE_INDEX ON EMPLOYE(NOM_EMPL,PREN_EMPL);

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CLIENT
-- -----------------------------------------------------------------------------

CREATE UNIQUE INDEX CLIENT_INDEX ON CLIENT(NOM_CLI,PREN_CLI);

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE VOL_REEL
-- -----------------------------------------------------------------------------

CREATE UNIQUE INDEX VOL_INDEX ON VOL_REEL(JOUR_VOL,MOIS_VOL,ANNE_VOL);