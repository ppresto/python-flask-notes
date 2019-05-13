python-flask-notes
====================

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Setup](#setup)
- [Setup Project](#setup-project)
	- [Create virtual environment](#create-virtual-environment)
	- [Quick PostgreSQL Setup](#quick-postgresql-setup)
		- [Create Notes DB](#create-notes-db)
		- [Populate the notes DB.](#populate-the-notes-db)
	- [PostgreSQL Setup with sample DB and Flask Migrate](#postgresql-setup-with-sample-db-and-flask-migrate)
		- [Create sample DB](#create-sample-db)
		- [Create notes DB](#create-notes-db)
		- [Use Flask Migrate to create required tables](#use-flask-migrate-to-create-required-tables)
	- [Run Flask as you develope](#run-flask-as-you-develope)
- [Docker](#docker)
	- [Build Docker image](#build-docker-image)
	- [Run Docker image](#run-docker-image)
	- [Run image with Hashi Vault](#run-image-with-hashi-vault)
- [Application URL](#application-url)
- [References](#references)

<!-- /TOC -->

# Setup
This allows you to save notes and supports markup language in the body.

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

## Quick PostgreSQL Setup

### Create Notes DB
Using docker start your PostgreSQL instance.
```
source setEnv.sh
```
By sourcing setEnv.sh you enable the "runpostgres" alias to start your notesdb instance quickly.

```
runpostgres() {
  docker run -d --name postgres \
    --name notesdb \
    -e POSTGRES_USER=$POSTGRES_USER \
    -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
    -e POSTGRES_DB=notes \
    -p 80:5432 \
    -p 5432:5432 \
    --restart always \
    postgres:9.6.8-alpine "$@"
}
```
### Populate the notes DB.
Using the roles and sql dump files in the ./database directory lets restore a working database.

```
psql postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${HOST}:5432/notes < notes_roles.sql

psql postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${HOST}:5432/notes < notes_dump.sql
```

## PostgreSQL Setup with sample DB and Flask Migrate

### Create sample DB
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

### Create notes DB
Using Docker
```
docker exec -i postgres psql postgres -U demo -c "CREATE DATABASE notes;”
```
Using psql
```
psql postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${HOST}:5432/sample -c "CREATE DATABASE notes;”
```

### Use Flask Migrate to create required tables
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

# Docker

## Build Docker image
```
cd ./notes
docker build -t ppresto/notes .
docker push
```
## Run Docker image
```
docker run -it -p3000:3000 --name=notes --rm ppresto/notes
```

## Run image with Hashi Vault
the run.sh will look for vault endpoints if defined and get dynamic PostgreSQL secret to connect to DB.

```
docker run -it -p3000:3000 --name=notes --rm --network=hashi_default \
-e VAULT_TOKEN="s.<VAULT_TOKEN>" -e VAULT_ADDR="http://vault:8200" ppresto/notes
```

#  Application URL
http://localhost:3000

# References
Linux Acadamy Training
Flask: http://flask.pocoo.org/docs/1.0/tutorial/database/
SQLAlchemy: http://flask-sqlalchemy.pocoo.org/2.3/
Flask Views: http://flask.pocoo.org/docs/1.0/tutorial/views/
Flask Templates: http://flask.pocoo.org/docs/1.0/tutorial/templates/
Werkzeug: https://palletsprojects.com/p/werkzeug/
