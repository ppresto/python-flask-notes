import os

from flask import Flask
from flask_migrate import Migrate

# flas_migrate creates migrations so we can create tables we need and make modifications as we change classes.
# For example, If we add column to user class
def create_app(test_config=None):
    app = Flask(__name__)
    app.config.from_mapping(
        SECRET_KEY=os.environ.get('SECRET_KEY', default='dev')
    )

    if test_config is None:
        app.config.from_pyfile('config.py','silent=True')
    else:
        app.config.from_mapping(test_config)

    from .modules import db

    db.init_app(app)
    migrate = Migrate(app, db)

    return app
