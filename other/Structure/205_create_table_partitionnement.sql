-- -----------------------------------------------------------------------------
--       PARTITION VOL_REEL
-- -----------------------------------------------------------------------------

ALTER TABLE VOL_REEL ADD partition p_2015 
	values less than (to_date('2016-01-01','YYYY-MM-DD'));
ALTER TABLE VOL_REEL ADD partition p_2016
        values less than (to_date('2017-01-01','YYYY-MM-DD'));
ALTER TABLE VOL_REEL ADD partition p_2017
	values less than (to_date('2018-01-01','YYYY-MM-DD'));

