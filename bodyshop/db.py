from flask import g
import psycopg2


def connect_to_database():
    db = psycopg2.connect(dbname='haley', user='haley')
    return db


def get_db():
    if 'db' not in g:
        g.db = connect_to_database()
    return g.db
