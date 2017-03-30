Use LogAnalysis

DELIMITER //

DROP PROCEDURE IF EXISTS sp_CountTable//

CREATE PROCEDURE sp_CountTable(IN v_Game VARCHAR(20))
BEGIN
	DECLARE v_TableNM VARCHAR(20);
	DECLARE v_Sql VARCHAR(1000);
    DECLARE i_Num INT;
    
    SET i_Num = 0;
    
    WHILE i_Num < 7 DO
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
        
        SET i_Num = i_Num + 1;
	END WHILE;
END//

DELIMITER ;

