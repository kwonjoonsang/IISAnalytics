Use LogAnalysis

DELIMITER //

DROP PROCEDURE IF EXISTS sp_CreateTable//

CREATE PROCEDURE sp_CreateTable(IN v_Game VARCHAR(20))
BEGIN
	DECLARE v_TableNM VARCHAR(20);
	DECLARE v_Sql VARCHAR(1000);
    DECLARE i_Num INT;
    
    SET i_Num = 0;
    
    WHILE i_Num < 7 DO
		SET v_TableNM = CONCAT('T', v_Game, '00', CAST(i_Num AS CHAR(1)));
        
		SET v_Sql = "";
        SET v_Sql = CONCAT(v_Sql, 'CREATE TABLE IF NOT EXISTS ', v_TableNM, '(');
		SET v_Sql = CONCAT(v_Sql, '		v_DomainNM	VARCHAR(50)	NOT NULL');
		SET v_Sql = CONCAT(v_Sql, ',	v_ServerNM	VARCHAR(20)	NOT NULL');
        SET v_Sql = CONCAT(v_Sql, ',	c_Date		CHAR(10)	NOT NULL');
        SET v_Sql = CONCAT(v_Sql, ',	c_Time		CHAR(8)');
        SET v_Sql = CONCAT(v_Sql, ',	c_Method	CHAR(10)');
        SET v_Sql = CONCAT(v_Sql, ',	v_Stem		VARCHAR(200)');
        SET v_Sql = CONCAT(v_Sql, ',	v_Query		VARCHAR(500)');
        SET v_Sql = CONCAT(v_Sql, ',	v_IP		VARCHAR(20)');
        SET v_Sql = CONCAT(v_Sql, ',	s_Status	SMALLINT');
        SET v_Sql = CONCAT(v_Sql, ',	i_SCBytes	INT');
        SET v_Sql = CONCAT(v_Sql, ',	i_CSBytes	INT');
        SET v_Sql = CONCAT(v_Sql, ',	i_TimeTaken	INT');
        SET v_Sql = CONCAT(v_Sql, ') ENGINE=INNODB;');
		
        SET @exec_Sql = v_Sql;
        PREPARE stmt FROM @exec_Sql;
        EXECUTE stmt;
		
        SET v_Sql = "";
        SET v_Sql = CONCAT('ALTER TABLE ', v_TableNM, ' ADD INDEX (v_DomainNM, v_ServerNM, c_Date);');
        
        SET @exec_Sql = v_Sql;
        PREPARE stmt FROM @exec_Sql;
        EXECUTE stmt;
        
        SET i_Num = i_Num + 1;
	END WHILE;
END//

DELIMITER ;

