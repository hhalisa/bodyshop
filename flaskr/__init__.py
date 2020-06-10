import psycopg2
#import app
import sys
import json

__version__ = '0.1.0'

# if __name__ == '__main__':
#    try:
#        con = psycopg2.connect(dbname='haley', user='haley')
#        s = app.vehicle_history(con, "6756")
#        print(json.dumps(s))
#    except psycopg2.DatabaseError as e:
#        print(f'Error {e}')
#        sys.exit(1)
#    finally:
#        if con:
#            con.close()
