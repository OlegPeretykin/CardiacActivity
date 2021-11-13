Option Compare Database
Option Explicit
' Глобальные переменные и функции

'Подключение таблиц из СУБД Postgres
Public Sub SystemDeployment()
Dim db As DAO.Database, str_conn$
Dim tdf As DAO.TableDef, ODBCTableName$, AccessTableName$
Dim TablesArray() As Variant, i&

TablesArray = Array("subject", "events_on_day", "days_taken_into_account") 'список всех нужных нам таблиц в БД
Set db = CurrentDb
str_conn = "ODBC;DRIVER={PostgreSQL ODBC Driver(UNICODE)};Database=CardiacActivity;SERVER=localhost;Port=5432;CA=d;A6=;A7=100;A8=4096;B0=255;B1=8190;BI=0;C2=dd_;CX=1c28b17bb;A1=7.4-1;AB=2;UID=postgres;PWD=Qwedsa33Qwedsa"

'MsgBox (Str(UBound(TablesArray)))
For i = 0 To UBound(TablesArray)
    ODBCTableName = TablesArray(i)
    AccessTableName = TablesArray(i)
    db.TableDefs.Refresh
    
    For Each tdf In db.TableDefs 'цикл проверки существования и уничтожение таблиц с такими именами
        If tdf.Name = AccessTableName Then
            db.TableDefs.Delete tdf.Name
            Exit For
        End If
    Next tdf
    
    Set tdf = db.CreateTableDef(AccessTableName)
    If InStr(str_conn, "PWD=") Then
        tdf.Attributes = dbAttachSavePWD
    End If
    
    tdf.SourceTableName = ODBCTableName
    tdf.Connect = str_conn
    db.TableDefs.Append tdf
Next i

Set db = Nothing
Set tdf = Nothing
End Sub