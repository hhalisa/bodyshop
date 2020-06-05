def get_client(db, client_id):
    cur = db.cursor()
    stmt = '''
        PREPARE get_client AS
        SELECT DISTINCT
        c.cid,
        c.fname,
        c.lname,
        c.telephone,
        v.vid
        FROM client c, vehicle v
        WHERE c.cid = v.cid
        AND c.cid = $1
    '''
    cur.execute(stmt)
    cur.execute(f'execute get_client({client_id})')
    ds = cur.fetchall()
    db.rollback()

    c = []
    for v in ds:
        x = {
            'client': {
                'client_id': v[0],
                'name': v[1] + ' ' + v[2],
                'phone': v[3],
            },
            'vehicle': [
                {
                    'vehicle_id': [v[4]],
                },
            ],
        }
        c.append(x)

    return c


def delete_client(db, client_id):
    cur = db.cursor()
    stmt = '''
        PREPARE delete_client AS
        DELETE FROM client c
        WHERE c.cid = $1
    '''
    cur.execute(stmt)
    cur.execute(f'execute delete_client({client_id})')
    db.commit()
    return cur.rowcount


def client_list(db, client_id):
    cur = db.cursor()
    stmt = '''
        PREPARE client_list AS
        SELECT DISTINCT
        c.cid,
        c.fname,
        c.lname,
        c.telephone
        FROM client c 
    '''
    cur.execute(stmt)
    cur.execute(f'execute client_list({client_id})')
    ds = cur.fetchall()
    db.rollback()

    c_list = []
    for v in ds:
        x = {
            'client': {
                'client_id': v[0],
                'name': v[1] + ' ' + v[2],
                'phone': v[3],
            },
        }
        c_list.append(x)

    return c_list


class appointment:

    def __init__(self, appointment_id, client_id, vehicle_id, date, time, *args):
        self.appointment_id = appointment_id
        self.client_id = client_id
        self.vehicle_id = vehicle_id
        self.date = date
        self.time = time

    def __str__(self):
        formatted = f'{self.appointment_id} {self.client_id} {self.vehicle_id} {self.date} {self.time} '
        return formatted

    def get_scheduled_service(self, db):
        cur = db.cursor()
        stmt = '''
            PREPARE get_scheduled_service AS
            SELECT ap.appid, s.type, s.sid
            FROM service s, app_service ap
            WHERE s.sid = ap.sid
            AND ap.appid = $1
        '''
        cur.execute(stmt)
        cur.execute(f"execute get_scheduled_service('{self.appointment_id}')")
        ds = cur.fetchall()
        db.rollback()

        ss_list = []
        for v in ds:
            ss = scheduled_service(v[0], v[1], v[2])
            ss_list.append(ss)

        return ss_list


def get_appointment(db, appointment_id):
    cur = db.cursor()
    stmt = '''
        PREPARE get_appointment AS
        SELECT DISTINCT
        a.appid,
        c.cid,
        v.vid,
        a.date,
        a.time
        FROM appointment a, client c, vehicle v
        WHERE v.vid = a.vid
        AND v.cid = c.cid
        AND a.appid = $1
    '''
    cur.execute(stmt)
    cur.execute(f"execute get_appointment('{appointment_id}')")
    ds = cur.fetchall()
    db.rollback()

    a = []
    for v in ds:
        x = {
            'appointment': {
                'appointment_date': v[3].__str__(),
                'appointment_id': v[0],
            },
            'client': {
                'client_id': v[1],
            },
            'vehicle': [
                {
                    'vehicle_id': v[2],
                },
            ],
        }
        a.append(x)

    return a


def delete_appointment(db, appointment_id):
    cur = db.cursor()
    stmt = '''
        PREPARE delete_appointment AS
        DELETE FROM appointment a
        WHERE a.appid = $1
    '''
    cur.execute(stmt)
    cur.execute(f"execute delete_appointment('{appointment_id}')")
    db.commit()
    return cur.rowcount


def appointment_list(db, appointment_id):
    cur = db.cursor()
    stmt = '''
        PREPARE appointment_list AS
        SELECT DISTINCT
        a.appid,
        c.cid,
        v.vid,
        a.time,
        a.date
        FROM appointment a, client c, vehicle v
        WHERE v.vid = a.vid
        AND v.cid = c.cid
    '''
    cur.execute(stmt)
    cur.execute(f"execute appointment_list('{appointment_id}')")
    ds = cur.fetchall()
    db.rollback()

    a_list = []
    for v in ds:
        x = {
            'appointment': {
                'appointment_date': v[4].__str__(),
                'appointment_id': v[0],
            },
            'client': {
                'client_id': v[1],
            },
            'vehicle': [
                {
                    'vehicle_id': v[2],
                },
            ],
        }
        a_list.append(x)

    return a_list


def get_vehicle(db, vehicle_id):
    cur = db.cursor()
    stmt = '''
        PREPARE get_vehicle AS
        SELECT
        v.cid,
        v.vid,
        v.make,
        v.model,
        v.year,
        v.milage
        FROM vehicle v 
        WHERE v.vid = $1
    '''
    cur.execute(stmt)
    cur.execute(f'execute get_vehicle({vehicle_id})')
    ds = cur.fetchall()
    db.rollback()

    gv = []
    for v in ds:
        x = {
            'client': {
                'client_id': v[0],
            },
            'vehicle': [
                {
                    'make': v[2],
                    'model': v[3],
                    'year': v[4],
                    'vehicle_id': v[1],
                    'milage': v[5],
                },
            ],
        }
        gv.append(x)

    return gv


def delete_vehicle(db, vehicle_id):
    cur = db.cursor()
    stmt = '''
        PREPARE delete_vehicle  AS
        DELETE FROM vehicle v
        WHERE v.vid= $1
    '''
    cur.execute(stmt)
    cur.execute(f'execute delete_vehicle({vehicle_id})')
    db.commit()
    return cur.rowcount


def vehicle_list(db, vehicle_id):
    cur = db.cursor()
    stmt = '''
        PREPARE vehicle_list AS
        SELECT
        c.cid,
        v.vid,
        v.make,
        v.model,
        v.year
        FROM vehicle v, client c
        WHERE v.cid = c.cid
    '''
    cur.execute(stmt)
    cur.execute(f'execute vehicle_list({vehicle_id})')
    ds = cur.fetchall()
    db.rollback()

    v_list = []
    for v in ds:
        x = {
            'client': {
                'client_id': v[0],
            },
            'vehicle': [
                {
                    'make': v[2],
                    'model': v[3],
                    'year': v[4],
                    'vehicle_id': v[1],
                },
            ],
        }
        v_list.append(x)

    return v_list


def get_service(db, service_id):
    cur = db.cursor()
    stmt = '''
        PREPARE get_service AS
        SELECT s.sid, s.type, s.price 
        FROM service s
        WHERE sid = $1
    '''
    cur.execute(stmt)
    cur.execute(f'execute get_service({service_id})')
    ds = cur.fetchall()
    db.rollback()

    s = []
    for v in ds:
        x = {
            'service': {
                'price': v[2],
                'service_id': v[0],
                'service_type': v[1],
            },
        }
        s.append(x)

    return s


def delete_service(db, service_id):
    cur = db.cursor()
    stmt = '''
        PREPARE delete_service  AS
        DELETE FROM service s
        WHERE s.sid= $1
    '''
    cur.execute(stmt)
    cur.execute(f'execute delete_service({service_id})')
    db.commit()
    return cur.rowcount


def service_list(db, service_id):
    cur = db.cursor()
    stmt = '''
        PREPARE service_list AS
        SELECT s.sid, s.type, s.price 
        FROM service s
    '''
    cur.execute(stmt)
    cur.execute(f'execute service_list({service_id})')
    ds = cur.fetchall()
    db.rollback()

    s_list = []
    for v in ds:
        s = {
            'service': [
                {
                    'price_in_dollars': v[2],
                    'service_id': v[0],
                    'service_type': v[1],
                },
            ],
        }
        s_list.append(s)

    return s_list


class scheduled_service:

    def __init__(self, appt_service_id, appointment_id, service_id):
        self.appt_service_id = appt_service_id
        self.appointment_id = appointment_id
        self.service_id = service_id

    def __str__(self):
        formatted = f'{self.appt_service_id} {self.appointment_id} {self.service_id}'
        return formatted


def vehicle_history(db, vehicle_id):
    cur = db.cursor()
    stmt = '''
        PREPARE vehicle_history AS
        SELECT v.vid, v.make, v.model, v.year, a.date, s.type
        FROM  vehicle v, appointment a, service s, app_service ap
        WHERE v.vid = a.vid
        AND a.appid = ap.appid
        AND ap.sid = s.sid
        AND v.vid IN(
            SELECT v.vid
            FROM vehicle v
            WHERE v.vid = $1 
        )
    '''
    cur.execute(stmt)
    cur.execute(f'execute vehicle_history({vehicle_id})')
    ds = cur.fetchall()
    db.rollback()

    v_history = []
    for v in ds:
        hist = {
            'appointment': {
                'appointment_date': v[4].__str__(),
            },
            'service': [v[5]],
            'vehicle': [
                {
                    'make': v[1],
                    'model': v[2],
                    'year': v[3],
                    'vehicle_id': v[0],
                },
            ],
        }
        v_history.append(hist)

    return v_history


def client_history(db, client_id):
    cur = db.cursor()
    stmt = '''
        PREPARE client_history AS
        SELECT c.cid, v.vid, v.make, v.model, v.year, a.date, s.type
        FROM client c, vehicle v, appointment a, app_service ap, service s
        WHERE c.cid = v.cid
        AND v.vid = a.vid
        AND a.appid = ap.appid
        AND ap.sid = s.sid
        AND c.cid = $1 
    '''
    cur.execute(stmt)
    cur.execute(f'execute client_history({client_id})')
    ds = cur.fetchall()
    db.rollback()

    c_history = []
    for v in ds:
        hist = {
            'appointment': {
                'appointment_date': v[5].__str__(),
            },
            'client': {
                'client_id': v[0],
            },
            'service': [v[6]],
            'vehicle': [
                {
                    'make': v[2],
                    'model': v[3],
                    'year': v[4],
                    'vehicle_id': v[1],
                },
            ],
        }
        c_history.append(hist)

    return c_history
