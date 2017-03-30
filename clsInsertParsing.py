#-*- coding:cp949-*-

import sys
import clsDBHandler as dh
import CommonFunction as cf

class InsertParsing:
	def __init__(self, **dicInsert):
		self.dicConn = {}
		self.objDBHandler = dh.DBHandler(self.dicConn)

	def Run_DeleteStatus(self, strDate):
		strSQL = ""
		strSQL += " DELETE FROM TSTATUS000"
		strSQL += " WHERE c_Date = '" + strDate + "'"

		strLog = self.objDBHandler.fnPInsert(strSQL)

	def Run_InsertStatus(self, strTable, strDate):
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

		strLog = self.objDBHandler.fnPInsert(strSQL)
		cf.fnSaveLog(strLog, "", strTable)

	def Get_ServerDomainList(self, strDate):
		strSQL = ""
		strSQL += " SELECT	DISTINCT"
		strSQL += " 		v_DomainNM"
		strSQL += " ,		v_ServerNM"
		strSQL += " FROM	TSTATUS000"
		strSQL += " WHERE	c_Date	= '" + strDate + "'"

		self.objDBHanadler.dbCursor.execute(strSQL)
		listLists = self.objDBHanadler.dbCursor.fetchall()

		return listLists

	def Run_InsertDTDB(self, strDate, strLogNum):
		listLists = Get_ServerDomainList(strDate)

		for listList in listLists:
			arrGameNM = listList.split('-')
			strGameNM = arrGameNM[0]

			strTable = cf.fnSelTableNM(strGameNM, strLogNum)
			Run_InsertDomainTime(listList, strDate, strTable)

	def Run_InsertDomainTime(self, listList, strDate, strTable):
		strSQL = ""
		strSQL += " INSERT INTO TTIME000"
		strSQL += " 	SELECT	v_DomainNM"
		strSQL += " 	,		v_ServerNM"
		strSQL += " 	,		c_Date"
		strSQL += " 	,		v_Stem"
		strSQL += " 	,		v_Query"
		strSQL += " 	,		v_IP"
		strSQL += " 	,		i_TimeTaken"
		strSQL += " 	FROM	" + strTable
		strSQL += " 	WHERE	v_DomainNM	= '" + listList[0] + "'"
		strSQL += " 	AND		v_ServerNM	= '" + listList[1] + "'"
		strSQL += " 	AND		c_Date		= '" + strDate + "'"
		strSQL += " 	ORDER BY	v_DomainNM"
		strSQL += " 	,			v_ServerNM"
		strSQL += " 	,			i_TimeTaken"
		strSQL += " 	DESC"
		strSQL += " 	LIMIT 10"

		strLog = self.objDBHandler.fnPInsert(strSQL)
		cf.fnSaveLog(strLog, "", strTable)

	def Run_InsertDB(objDBHanadler, strLogNum, strDate):
		arrTableList = Get_TableList(objDBHandler)

		for strTable in arrTableList:
			strTable = "T" + strTable[0] + "00" + strLogNum
			print(strTable)
			Run_InsertStatus(objDBHandler, strTable, strDate)
