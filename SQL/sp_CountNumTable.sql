Use LogAnalysis

DELIMITER //

DROP PROCEDURE IF EXISTS sp_CountNumTable//

CREATE PROCEDURE sp_CountNumTable(IN v_Game VARCHAR(20), IN i_Num Int)
BEGIN
	DECLARE v_TableNM VARCHAR(20);
	DECLARE v_Sql VARCHAR(1000);
	SET v_TableNM = CONCAT('T', v_Game, '00', CAST(i_Num AS CHAR(1)));
    
	SET v_Sql = "";
    SET v_Sql = CONCAT(v_Sql, 'SELECT	''', v_TableNM, ''' ');
    SET v_Sql = CONCAT(v_Sql, ',        v_ServerNM ');
    SET v_Sql = CONCAT(v_Sql, ',		COUNT(*) AS CNT ');
    SET v_Sql = CONCAT(v_Sql, 'FROM 	', v_TableNM, ' ');
    SET v_Sql = CONCAT(v_Sql, 'GROUP BY	v_ServerNM');

    SET @exec_Sql = v_Sql;        
    PREPARE stmt FROM @exec_Sql;
    EXECUTE stmt;
END//

DELIMITER ;

