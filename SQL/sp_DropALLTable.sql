Use LogAnalysis

DELIMITER //

DROP PROCEDURE IF EXISTS sp_DropALLTable//

CREATE PROCEDURE sp_DropALLTable()
BEGIN
	CALL sp_DropTable('AIMA');
	CALL sp_DropTable('API');
	CALL sp_DropTable('ARPIEL');
	CALL sp_DropTable('BT');
	CALL sp_DropTable('BUBBLE');
	CALL sp_DropTable('BULL');
	CALL sp_DropTable('CABNB');
	CALL sp_DropTable('CLS');
	CALL sp_DropTable('COMBAT');
	CALL sp_DropTable('CSO2');
	CALL sp_DropTable('CSO');
	CALL sp_DropTable('DAI');
	CALL sp_DropTable('EL');
	CALL sp_DropTable('EVER');
	CALL sp_DropTable('FO3');
	CALL sp_DropTable('HU');
	CALL sp_DropTable('KART');
	CALL sp_DropTable('MABI');
	CALL sp_DropTable('MB');
	CALL sp_DropTable('MOBILE');
	CALL sp_DropTable('MS2');
	CALL sp_DropTable('MS');
	CALL sp_DropTable('MV');
	CALL sp_DropTable('NFS');
	CALL sp_DropTable('NPS');
	CALL sp_DropTable('SA2');
	CALL sp_DropTable('SECU');
	CALL sp_DropTable('SIGN');
	CALL sp_DropTable('TERA');
	CALL sp_DropTable('TFO');
	CALL sp_DropTable('TOS');
	CALL sp_DropTable('UEVENT');
	CALL sp_DropTable('WIN');
END//

DELIMITER ;