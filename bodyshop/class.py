class client:

    def __init__(self, client_id, fname, lname, telephone, *args):
        self.client_id = client_id
        self.fname = fname
        self.lname = lname
        self.telephone = telephone

    def __str__(self):
        formatted = f'{self.client_id} {self.fname} {self.lname} {self.telephone} '
        return formatted


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


class service:

    def __init__(self, service_id, service_type, price, *args):
        self.service_id = service_id
        self.service_type = service_type
        self.price = price

    def __str__(self):
        formatted = f'{self.service_id} {self.service_type} {self.price}'
        return formatted


class scheduled_service:

    def __init__(self, appt_service_id, appointment_id, service_id):
        self.appt_service_id = appt_service_id
        self.appointment_id = appointment_id
        self.service_id = service_id

    def __str__(self):
        formatted = f'{self.appt_service_id} {self.appointment_id} {self.service_id}'
        return formatted


class history:

    def __init__(self, client_id, vehicle_id, make, model, year,
                 appointment_date, service_type, *args):
        self.client_id = client_id
        self.vehicle_id = vehicle_id
        self.make = make
        self.model = model
        self.year = year
        self.appointment_date = appointment_date
        self.service_type = service_type


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
