import psycopg2
import appt
import sys
import json

__version__ = '0.1.0'

if __name__ == '__main__':
    try:
        con = psycopg2.connect(dbname='haley', user='haley')
        c_hist = appt.get_client_history(con, "11021")
        print(json.dumps(c_hist))
    except psycopg2.DatabaseError as e:
        print(f'Error {e}')
        sys.exit(1)
    finally:
        if con:
            con.close()
