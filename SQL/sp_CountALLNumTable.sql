Use LogAnalysis

DELIMITER //

DROP PROCEDURE IF EXISTS sp_CountALLNumTable//

CREATE PROCEDURE sp_CountALLNumTable(IN i_Num Int)
BEGIN
	CALL sp_CountNumTable('AIMA', i_Num);
	CALL sp_CountNumTable('API', i_Num);
	CALL sp_CountNumTable('ARPIEL', i_Num);
	CALL sp_CountNumTable('BT', i_Num);
	CALL sp_CountNumTable('BUBBLE', i_Num);
	CALL sp_CountNumTable('BULL', i_Num);
	CALL sp_CountNumTable('CABNB', i_Num);
	CALL sp_CountNumTable('CLS', i_Num);
	CALL sp_CountNumTable('COMBAT', i_Num);
	CALL sp_CountNumTable('CSO2', i_Num);
	CALL sp_CountNumTable('CSO', i_Num);
	CALL sp_CountNumTable('DAI', i_Num);
	CALL sp_CountNumTable('EL', i_Num);
	CALL sp_CountNumTable('EVER', i_Num);
	CALL sp_CountNumTable('FO3', i_Num);
	CALL sp_CountNumTable('HU', i_Num);
	CALL sp_CountNumTable('KART', i_Num);
	CALL sp_CountNumTable('MABI', i_Num);
	CALL sp_CountNumTable('MOBILE', i_Num);
	CALL sp_CountNumTable('MB', i_Num);
	CALL sp_CountNumTable('MS2', i_Num);
	CALL sp_CountNumTable('MS', i_Num);
	CALL sp_CountNumTable('MV', i_Num);
	CALL sp_CountNumTable('NFS', i_Num);
	CALL sp_CountNumTable('NPS', i_Num);
	CALL sp_CountNumTable('SA2', i_Num);
	CALL sp_CountNumTable('SECU', i_Num);
	CALL sp_CountNumTable('SIGN', i_Num);
	CALL sp_CountNumTable('TERA', i_Num);
	CALL sp_CountNumTable('TFO', i_Num);
	CALL sp_CountNumTable('TOS', i_Num);
	CALL sp_CountNumTable('UEVENT', i_Num);
	CALL sp_CountNumTable('WIN', i_Num);
END//

DELIMITER ;