class client:

    def __init__(self, client_id, fname, lname, telephone, *args):
        self.client_id = client_id
        self.fname = fname
        self.lname = lname
        self.telephone = telephone

    def __str__(self):
        formatted = f'{self.client_id} {self.fname} {self.lname} {self.telephone} '
        return formatted


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
    data = cur.fetchall()[0]
    db.rollback()

    c = client(data[0], data[1], data[2], data[3], data[4])
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
        c = client(v[0], v[1], v[2], v[3])
        c_list.append(c)

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
    data = cur.fetchall()[0]

    db.rollback()

    a = appointment(data[0], data[1], data[2], data[3], data[4])

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
        a = appointment(v[0], v[1], v[2], v[3], v[4])
        a_list.append(a)

    return a_list


class vehicle:

    def __init__(self, client_id, vehicle_id, make, model, year, *args):
        self.client_id = client_id
        self.vehicle_id = vehicle_id
        self.make = make
        self.model = model
        self.year = year

    def __str__(self):
        formatted = f'{self.client_id} {self.vehicle_id} {self.make} {self.model} {self.year} '
        return formatted


def get_vehicle(db, vehicle_id):
    cur = db.cursor()
    stmt = '''
        PREPARE get_vehicle AS
        SELECT
        c.cid,
        v.vid,
        v.make,
        v.model,
        v.year,
        v.milage
        FROM vehicle v, client c
        WHERE v.vid = $1
    '''
    cur.execute(stmt)
    cur.execute(f'execute get_vehicle({vehicle_id})')
    data = cur.fetchall()[0]
    db.rollback()

    v = vehicle(data[0], data[1], data[2], data[3], data[4], data[5])

    return v


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
        v = vehicle(v[0], v[1], v[2], v[3], v[4])
        v_list.append(v)

    return v_list


class service:

    def __init__(self, service_id, service_type, price, *args):
        self.service_id = service_id
        self.service_type = service_type
        self.price = price

    def __str__(self):
        formatted = f'{self.service_id} {self.service_type} {self.price}'
        return formatted


def get_service(db, service_id):
    cur = db.cursor()
    stmt = '''
        PREPARE get_service AS
        SELECT *
        FROM service
        WHERE sid = $1
    '''
    cur.execute(stmt)
    cur.execute(f'execute get_service({service_id})')
    data = cur.fetchall()[0]

    db.rollback()

    s = service(data[0], data[1], data[2])

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
        SELECT *
        FROM service
    '''
    cur.execute(stmt)
    cur.execute(f'execute service_list({service_id})')
    ds = cur.fetchall()
    db.rollback()

    s_list = []
    for v in ds:
        s = service(v[0], v[1], v[2])
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


class vehicle_history:

    def __init__(self, vehicle_id, make, model, year, appointment_date, service_type, *args):
        self.vehicle_id = vehicle_id
        self.make = make
        self.model = model
        self.year = year
        self.appointment_date = appointment_date
        self.service_type = service_type

    def __str__(self):
        formatted = f' {self.vehicle_id} {self.make} {self.model} {self.year} {self.appointment_date} {self.service_type}'
        return formatted


def get_vehicle_history(db, vehicle_id):
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
        v = vehicle_history(v[0], v[1], v[2], v[3], v[4], v[5])
        v_history.append(v)

    return v_history


class client_history:

    def __init__(self, client_id, vehicle_id, make, model, year, appointment_date, service_type, *args):
        self.client_id = client_id
        self.vehicle_id = vehicle_id
        self.make = make
        self.model = model
        self.year = year
        self.appointment_date = appointment_date
        self.service_type = service_type

    def __str__(self):
        formatted = f' {self.client_id} {self.vehicle_id} {self.make} {self.model} {self.year} {self.appointment_date} {self.service_type}'
        return formatted


def get_client_history(db, client_id):
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
        #c = client_history(v[0], v[1], v[2], v[3], v[4], v[5], v[6])
        c_history.append(hist)

    return c_history
