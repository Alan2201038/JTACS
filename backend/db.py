import sqlite3
from sqlite3 import connect, Row


def dict_factory(cur, row):
    return {col[0]: row[_] for _, col in enumerate(cur.description)}


def initialise_db():
    connection = connect("aisecure.db")
    with open("aisecure.sql") as file:
        connection.executescript(file.read())
    connection.commit()
    connection.close()


def get_db():
    connection = sqlite3.connect("aisecure.db")
    connection.row_factory = dict_factory
    cursor = connection.cursor()
    return connection, cursor


initialise_db()
