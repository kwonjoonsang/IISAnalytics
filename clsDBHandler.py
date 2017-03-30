import pymysql
import sys

class DBHandler:
	def __init__(self, **strConn):
		strConn['host'] = "192.168.101.65"
		strConn['port'] = 13306
		strConn['user'] = "root"
		strConn['passwd'] = "rnjswnstkd!2"
		strConn['db'] = "LogAnalysis"
		strConn['charset'] = "utf8"
		autocommit = strConn.pop("autocommit", True)

		self.dbConn = pymysql.connect(**strConn)
		self.dbConn.autocommit(autocommit)
		self.dbCursor = self.dbConn.cursor()

	def fnInsert(self, strSql, *listData):
		try:
			strInfo = self.dbCursor.executemany(strSql, listData)
			self.dbConn.commit()
		except Exception as e:
			strInfo = str(e)
			self.dbConn.rollback()
                        
		return strInfo
	
	def fnPInsert(self, strSql):
		try:
			strInfo = self.dbCursor.execute(strSql)
			self.dbConn.commit()
		except Exception as e:
			strInfo = str(e)
			self.dbConn.rollback()
                        
		return strInfo
	def __del__(self):
		self.dbCursor.close()
		self.dbConn.close()
