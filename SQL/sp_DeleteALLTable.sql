Use LogAnalysis

DELIMITER //

DROP PROCEDURE IF EXISTS sp_DeleteALLTable//

CREATE PROCEDURE sp_DeleteALLTable()
BEGIN
	CALL sp_DeleteTable('AIMA');
	CALL sp_DeleteTable('API');
	CALL sp_DeleteTable('ARPIEL');
	CALL sp_DeleteTable('BT');
	CALL sp_DeleteTable('BUBBLE');
	CALL sp_DeleteTable('BULL');
	CALL sp_DeleteTable('CABNB');
	CALL sp_DeleteTable('CLS');
	CALL sp_DeleteTable('COMBAT');
	CALL sp_DeleteTable('CSO2');
	CALL sp_DeleteTable('CSO');
	CALL sp_DeleteTable('DAI');
	CALL sp_DeleteTable('EL');
	CALL sp_DeleteTable('EVER');
	CALL sp_DeleteTable('FO3');
	CALL sp_DeleteTable('HU');
	CALL sp_DeleteTable('KART');
	CALL sp_DeleteTable('MABI');
	CALL sp_DeleteTable('MB');
	CALL sp_DeleteTable('MOBILE');
	CALL sp_DeleteTable('MS2');
	CALL sp_DeleteTable('MS');
	CALL sp_DeleteTable('MV');
	CALL sp_DeleteTable('NFS');
	CALL sp_DeleteTable('NPS');
	CALL sp_DeleteTable('SA2');
	CALL sp_DeleteTable('SECU');
	CALL sp_DeleteTable('SIGN');
	CALL sp_DeleteTable('TERA');
	CALL sp_DeleteTable('TFO');
	CALL sp_DeleteTable('TOS');
	CALL sp_DeleteTable('UEVENT');
	CALL sp_DeleteTable('WIN');
END//

DELIMITER ;