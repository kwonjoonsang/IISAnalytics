import os
import datetime

def fnGetFile(strCurLog):
	try:
		with open(strCurLog, mode="rt", errors="ignore") as f:
			listLines = f.readlines()
	except:
		listLines = []

	return listLines

def fnGetSetting():
	strCurDir = os.getcwd()
	strCurLog = strCurDir + "\\setting.txt"
	dicSetting = {'Dir': ''}

	listSettings = fnGetFile(strCurLog)
		
	for listSetting in listSettings:
		if listSetting.find("Dir=") > -1:
			arrDirSetting = listSetting.split('=')
			strDirSetting = arrDirSetting[1]
			
			dicSetting['Dir'] = strDirSetting

	return dicSetting

def fnSaveLog(strLog, strDomain, strServerName):
	dicSetting = fnGetSetting()
	strDirSetting = dicSetting['Dir']

	dtDateTime = datetime.datetime.now()
	strDate = dtDateTime.strftime("%Y-%m-%d")
	strTime = dtDateTime.strftime("%H:%M:%S")

	strLogName = "LA" + strDate.replace("-", "") + ".log"
	strFullName = strDirSetting + "\\" + strLogName

	if strLog == "":
		strLog = strServerName + " " + strDomain + "Log is completed"
	else:
		strLog = strServerName + " " + strDomain + " " + str(strLog)

	strMakeLog = strDate + "\t" + strTime + "\t" + strLog + "\n"

	with open(strFullName, mode="a", errors="ignore") as f:
		f.write(strMakeLog)

def fnSeoulTime(strDate, strTime):
	strDateTime = strDate + " " + strTime

	dtDateTime = datetime.datetime.strptime(strDateTime, "%Y-%m-%d %H:%M:%S")
	dtSeoulDateTime = dtDateTime + datetime.timedelta(hours=9)

	strSeoulDate = dtSeoulDateTime.strftime("%Y-%m-%d")
	strSeoulTime = dtSeoulDateTime.strftime("%H:%M:%S")

	listSeoulDateTime = [strSeoulDate, strSeoulTime]

	return listSeoulDateTime

def fnSelTableNM(strServerNM, strLogNum):
	listServerNM = strServerNM.split("-")
	strGbn = listServerNM[0]
	strTableNM = 'T' + strGbn.upper() + '00' + strLogNum

	return strTableNM
