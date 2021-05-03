## steps
- create a virtual env : ```python3 -m venv venv```
- activate virtual env ```. venv/bin/activate```
- install dependencies ```pip3 install requirements.txt```

## make a .env file
- DB_HOST=localhost
- DB_USER=***
- DB_PASSWORD=***
- DB_NAME=dbname

## project steps
1. ```python db_script.py``` to create db
2. ```python tb_script.py``` to create tables
3. ```python add_data.py``` to insert rows in tables