class client:

    def __init__(self, client_id, fname, lname, telephone, *args):
        self.client_id = client_id
        self.fname = fname
        self.lname = lname
        self.telephone = telephone


class appointment:

    def __init__(self, appointment_id, client_id, vehicle_id, date, time, *args):
        self.appointment_id = appointment_id
        self.client_id = client_id
        self.vehicle_id = vehicle_id
        self.date = date
        self.time = time


class vehicle:

    def __init__(self, client_id, vehicle_id, make, model, year, milage, *args):
        self.client_id = client_id
        self.vehicle_id = vehicle_id
        self.make = make
        self.model = model
        self.year = year
        self.milage = milage


class service:

    def __init__(self, service_id, service_type, price, *args):
        self.service_id = service_id
        self.service_type = service_type
        self.price = price


class scheduled_service:

    def __init__(self, appt_service_id, appointment_id, service_id):
        self.appt_service_id = appt_service_id
        self.appointment_id = appointment_id
        self.service_id = service_id


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
