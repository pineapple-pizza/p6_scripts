from psycopg2 import connect, extensions, sql
from decouple import config

DB_HOST = config('DB_HOST')
DB_USER = config('DB_USER')
DB_PASSWORD = config('DB_PASSWORD')
DB_NAME = config('DB_NAME')

conn = connect(
    dbname=DB_NAME,
    user=DB_USER,
    host=DB_HOST,
    password=DB_PASSWORD
)

# object type: psycopg2.extensions.connection
# string for the new database name to be created
DB_NAME = "project_6_new"

# get the isolation leve for autocommit
autocommit = extensions.ISOLATION_LEVEL_AUTOCOMMIT

# set the isolation level for the connection's cursors
# will raise ActiveSqlTransaction exception otherwise
conn.set_isolation_level(autocommit)

# instantiate a cursor object from the connection
cursor = conn.cursor()

# use the sql module instead to avoid SQL injection attacks
cursor.execute(sql.SQL(
    "CREATE DATABASE {}"
).format(sql.Identifier(DB_NAME)))

# close the cursor to avoid memory leaks
cursor.close()

# close the connection to avoid memory leaks
conn.close()
