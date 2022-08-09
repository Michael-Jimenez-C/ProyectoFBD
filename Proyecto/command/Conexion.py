import MySQLdb#https://mysqldb.readthedocs.io/
import json
class Conexion:
    __conexion=None
    def getConexion():
        if Conexion.__conexion==None:
            file=open("./Servidor/command/config.json","r")
            data=json.load(file)
            Conexion.__conexion=MySQLdb.connect(host=data["host"],
                                                user=data["user"],
                                                passwd=data["password"],
                                                db=data["database"])
        return Conexion.__conexion
        
    def close():
        if Conexion.__conexion!=None:
            Conexion.__conexion.close()
            Conexion.__conexion=None