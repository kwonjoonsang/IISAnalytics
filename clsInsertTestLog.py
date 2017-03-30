#-*- coding:cp949-*-

import sys
import clsDBHandler as dh
import CommonFunction as cf

def Run_InsertRaw(objDBHandler, strTable, *listTemp):
	strSQL = ""
	strSQL += "INSERT INTO " + strTable + " "
	strSQL += "VALUES"
	strSQL += "(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
	
	strLog = objDBHandler.fnInsert(strSQL, *listTemp)
	cf.fnSaveLog(strLog, strDomain, strServerNM)

def Run_InsertDB(arrLines, objDBHandler, strDomain, strServerNM, strLogNum):
	listTemp = []
	arrLine = ""
	strTable = cf.fnSelTableNM(strServerNM, strLogNum)

	for arrLine in arrLines:
		if arrLine.count(" ") == 21:
			listLine = arrLine.split(" ")
			listDateTime = cf.fnSeoulTime(str(listLine[0]), str(listLine[1]))
			listTemp.append((str(strDomain), str(strServerNM), str(listDateTime[0]), str(listDateTime[1]), str(listLine[5]), str(listLine[6]), str(listLine[7]), str(listLine[10]), str(listLine[16]), str(listLine[19]), str(listLine[20]), str(listLine[21]).replace("\n","")))

	Run_InsertRaw(objDBHandler, strTable, *listTemp)

#MAIN
strConn = {}
strPath = sys.argv[1]
strDomain = sys.argv[2]
strServerNM = sys.argv[3]
strLogNum = sys.argv[4]

print(strDomain + " " + strServerNM)
cf.fnSaveLog("start data", strDomain, strServerNM)
objDBHandler = dh.DBHandler(**strConn)

with open(strPath, mode="rt", errors="ignore") as f:
	arrlines = f.readlines(100)

	print(strDomain + " " + strServerNM)
	Run_InsertDB(arrlines, objDBHandler, strDomain, strServerNM, strLogNum)
