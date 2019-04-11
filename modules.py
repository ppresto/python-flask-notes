from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()  #db connection

class User(db.Model):  # User Table inherit from DB Model
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(200))
    created_at = db.Column(db.DateTime, server_default=db.func.now())
    updated_at = db.Column(db.DateTime, server_default=db.func.now(), server_onupdate=db.func.now())

    # we want a user to have many notes.
    # backref when you reference from Note class you will have an author method that will map to user.
    # lazy will not automatically look for notes.  it will look when we try to access notes for user.
    notes = db.relationship('Note', backref='author', lazy=True)

class Note(db.Model):  # Note table inherit from DB Model
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(200))
    body = db.Column(db.Text)
    created_at = db.Column(db.DateTime, server_default=db.func.now())
    updated_at = db.Column(db.DateTime, server_default=db.func.now(), server_onupdate=db.func.now())

    # we want a user to have many notes so we store userid on the note.
    # ForeignKey : we need a valid user.id.  Need user for id.  ForeignKey is tied directly to User table.
    # nullable=false means every note has to have a user.id
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
