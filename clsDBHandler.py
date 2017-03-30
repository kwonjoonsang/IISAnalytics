import pymysql
import sys

class DBHandler:
	def __init__(self, **strConn):
		strConn['host'] = "[ServerIP]"
		strConn['port'] = [ServerPort]
		strConn['user'] = "[Account]"
		strConn['passwd'] = "[Password]"
		strConn['db'] = "[DB Name]"
		strConn['charset'] = "UTF8"
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
