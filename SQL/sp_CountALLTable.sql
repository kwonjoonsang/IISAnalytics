Use LogAnalysis

DELIMITER //

DROP PROCEDURE IF EXISTS sp_CountALLTable//

CREATE PROCEDURE sp_CountALLTable()
BEGIN
	CALL sp_CountTable('AIMA');
	CALL sp_CountTable('API');
	CALL sp_CountTable('ARPIEL');
	CALL sp_CountTable('BT');
	CALL sp_CountTable('BUBBLE');
	CALL sp_CountTable('BULL');
	CALL sp_CountTable('CABNB');
	CALL sp_CountTable('CLS');
	CALL sp_CountTable('COMBAT');
	CALL sp_CountTable('CSO2');
	CALL sp_CountTable('CSO');
	CALL sp_CountTable('DAI');
	CALL sp_CountTable('EL');
	CALL sp_CountTable('EVER');
	CALL sp_CountTable('FO3');
	CALL sp_CountTable('HU');
	CALL sp_CountTable('KART');
	CALL sp_CountTable('MABI');
	CALL sp_CountTable('MOBILE');
	CALL sp_CountTable('MB');
	CALL sp_CountTable('MS2');
	CALL sp_CountTable('MS');
	CALL sp_CountTable('MV');
	CALL sp_CountTable('NFS');
	CALL sp_CountTable('NPS');
	CALL sp_CountTable('SA2');
	CALL sp_CountTable('SECU');
	CALL sp_CountTable('SIGN');
	CALL sp_CountTable('TERA');
	CALL sp_CountTable('TFO');
	CALL sp_CountTable('TOS');
	CALL sp_CountTable('UEVENT');
	CALL sp_CountTable('WIN');
END//

DELIMITER ;