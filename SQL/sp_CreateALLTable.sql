Use LogAnalysis

DELIMITER //

DROP PROCEDURE IF EXISTS sp_CreateALLTable//

CREATE PROCEDURE sp_CreateALLTable()
BEGIN
	CALL sp_CreateTable('AIMA');
	CALL sp_CreateTable('API');
	CALL sp_CreateTable('ARPIEL');
	CALL sp_CreateTable('BT');
	CALL sp_CreateTable('BUBBLE');
	CALL sp_CreateTable('BULL');
	CALL sp_CreateTable('CABNB');
	CALL sp_CreateTable('CLS');
	CALL sp_CreateTable('COMBAT');
	CALL sp_CreateTable('CSO2');
	CALL sp_CreateTable('CSO');
	CALL sp_CreateTable('DAI');
	CALL sp_CreateTable('EL');
	CALL sp_CreateTable('EVER');
	CALL sp_CreateTable('FO3');
	CALL sp_CreateTable('HU');
	CALL sp_CreateTable('KART');
	CALL sp_CreateTable('MABI');
	CALL sp_CreateTable('MB');
	CALL sp_CreateTable('MOBILE');
	CALL sp_CreateTable('MS2');
	CALL sp_CreateTable('MS');
	CALL sp_CreateTable('MV');
	CALL sp_CreateTable('NFS');
	CALL sp_CreateTable('NPS');
	CALL sp_CreateTable('SA2');
	CALL sp_CreateTable('SECU');
	CALL sp_CreateTable('SIGN');
	CALL sp_CreateTable('TERA');
	CALL sp_CreateTable('TFO');
	CALL sp_CreateTable('TOS');
	CALL sp_CreateTable('UEVENT');
	CALL sp_CreateTable('WIN');
END//

DELIMITER ;