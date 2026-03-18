import sqlite3
import pandas as pd

db_path = r"C:\Users\akmaluddin.hasni\AppData\Roaming\DBeaverData\workspace6\.metadata\sample-database-sqlite-1\Chinook.db"

conn = sqlite3.connect(db_path)

df = pd.read_sql_query("SELECT * FROM Customer", conn)
print(df)

conn.close()
