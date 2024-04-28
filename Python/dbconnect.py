#https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/install-microsoft-odbc-driver-sql-server-macos?view=sql-server-ver16
import pyodbc 
# cnxn = pyodbc.connect("Driver={SQL Server Native Client 11.0};"
#                       "Server=sakettestserver.database.windows.net;"
#                       "Database=demo;"
#                       "uid:saket",
#                       "pwd:Mansa@0902"
#                       "Trusted_Connection=yes;")ODBC Driver 18 for SQL Server

cnxn = pyodbc.connect("Driver={/usr/local/lib/libmsodbcsql.18.dylib};Server=sakettestserver.database.windows.net;UID=saket;PWD=Mansa@0902;Database=demo;")

# cursor = cnxn.cursor()

# cursor.execute('SELECT * FROM information_schema.columns')

# print(cursor.fetchall())

import pandas as pd

query = """
"""

output = pd.read_sql_query(query,cnxn)

output = output[['productid','customerid']]

output.drop_duplicates(subset=[])

output.to_csv('~/Downloads/output_file.csv')