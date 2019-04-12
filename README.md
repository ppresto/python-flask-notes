python-flask-notes
====================

# Setup
This allows you to save notes and supports markup language in the body.

# References
Linux Acadamy Training
Flask: http://flask.pocoo.org/docs/1.0/tutorial/database/
SQLAlchemy: http://flask-sqlalchemy.pocoo.org/2.3/
Flask Views: http://flask.pocoo.org/docs/1.0/tutorial/views/
Flask Templates: http://flask.pocoo.org/docs/1.0/tutorial/templates/
Werkzeug: https://palletsprojects.com/p/werkzeug/

# Setup Project
Setup your Python and PostgreSQL environment as a prereq.  You can refer to 'mypython' project to use containers.

## Create virtual environment
```
cd python-flask-notes
pipenv --python python3.7 install flask python-dotenv psycopg2-binary Flask-SQLAlchemy Flask-Migrate
pipenv shell
mkdir templates static
touch {templates,static}/.gitkeep
vi config.py
vi models.py
vi __init__.py
```

## Setup PostgreSQL DB
### Initial DB
Make sure you have docker installed and access to the internet.  The db_setup.sh script will ask you to set db $POSTGRES_USER / $POSTGRES_PASSWORD, and defaults the $POSTGRES_DB='sample'.  It will import 1000 rows of sample data and setup the container to list on ports 80 and 5432
```
cd docker/scripts
./db_setup.sh
```
The db_setup.sh script can install docker on CentOS if required.  I have commented this secton out assuming this prereq is already in place for your environment.

Test your connectivity with PostgreSQL client (psql)
```
psql postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:80/sample -c "SELECT count(id) FROM employees;"

count
-------
  1000
(1 row)
```

### Create Notes DB
Using docker
```
docker exec -i postgres psql postgres -U demo -c "CREATE DATABASE notes;”
```

Using psql (assuing an existing db sample for connection)
```
psql postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${HOST}:5432/sample -c "CREATE DATABASE notes;”
```

### Use Flask Migrate to create additional tables
Initialize, generate migration, and use upgrade to run it. See what migrate is doing by reviewing ./migrations/versions/b8f90d067af9_.py
```
flask db init
flask db migrate
flask db upgrade
```

## Run Flask as you develope
Its best to bring up a new terminal and run the application in the forground.  Flask will automatically reload after changes and you can watch this terminal for immediate feedback.

Additionally, open your web browser to http://localhost:3000

```
$ export FLASK_ENV=development
$ export FLASK_APP='.'
$ flask run --host=0.0.0.0 --port=3000
```

#  Application URI's
http://localhost:3000/notes
