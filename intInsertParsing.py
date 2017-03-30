#-*- coding:cp949-*-

import sys
import clsDBHandler as dh
import CommonFunction as cf

def Run_DeleteStatus(objDBHandler, strDate):
	strSQL = ""
	strSQL += " DELETE FROM TSTATUS000"
	strSQL += " WHERE c_Date = '" + strDate + "'"

	strLog = objDBHandler.fnPInsert(strSQL)

def Run_DeleteTime(objDBHandler, strDate):
	strSQL = ""
	strSQL += " DELETE FROM TTIME000"
	strSQL += " WHERE c_Date = '" + strDate + "'"

	strLog = objDBHandler.fnPInsert(strSQL)

def Run_InsertStatus(objDBHandler, strTable, strDate):
	strSQL = ""
	strSQL += " INSERT INTO TSTATUS000"
	strSQL += "		SELECT 		v_DomainNM"
	strSQL += "		,			v_ServerNM"
	strSQL += "		,			c_Date"
	strSQL += "		,			s_Status"
	strSQL += "		,			COUNT(s_Status) AS Cnt"
	strSQL += "		FROM		" + strTable
	strSQL += "		WHERE		c_Date = '" + strDate + "'"
	strSQL += "		GROUP BY	v_DomainNM"
	strSQL += "		,			v_ServerNM"
	strSQL += "		,			c_Date"
	strSQL += "		,			s_Status"

	strLog = objDBHandler.fnPInsert(strSQL)
	cf.fnSaveLog(strLog, "", strTable)

def Run_InsertTime(objDBHandler, strTable, strDate):
	strSQL = ""
	strSQL += " INSERT INTO TTIME000"
	strSQL += "		SELECT 		v_DomainNM"
	strSQL += "		,			v_ServerNM"
	strSQL += "		,			c_Date"
	strSQL += "		,			v_Stem"
	strSQL += "		,			v_Query"
	strSQL += "		,			v_IP"
	strSQL += "		,			i_TimeTaken"
	strSQL += "		FROM		" + strTable
	strSQL += "		WHERE		c_Date = '" + strDate + "'"
	strSQL += "		GROUP BY	v_DomainNM"
	strSQL += "		,			v_ServerNM"
	strSQL += "		,			c_Date"
	strSQL += "		,			s_Status"

	strLog = objDBHandler.fnPInsert(strSQL)
	cf.fnSaveLog(strLog, "", strTable)

def Get_TableList(objDBHandler):
	strSQL = ""
	strSQL += " SELECT	v_GameNM"
	strSQL += " FROM	TGAME000"

	objDBHandler.dbCursor.execute(strSQL)
	arrTableList = objDBHandler.dbCursor.fetchall()

	return arrTableList

def Run_InsertDB(objDBHanadler, strLogNum, strDate):
	arrTableList = Get_TableList(objDBHandler)

	for strTable in arrTableList:
		strTable = "T" + strTable[0] + "00" + strLogNum
		print(strTable)
		Run_InsertStatus(objDBHandler, strTable, strDate)

#MAIN
strConn = {}
strLogNum = sys.argv[1]
strDate = sys.argv[2]

objDBHandler = dh.DBHandler(**strConn)

Run_DeleteStatus(objDBHandler, strDate)
Run_InsertDB(objDBHandler, strLogNum, strDate)