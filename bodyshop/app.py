from flask import Flask, request, Response
import bodyshopdb

app = Flask(__name__)

# client
# service
# appointment
# vehicle


@app.route('/appointments', methods=['GET', 'POST'])
def appointment_list():
    if request.method == 'GET':
        return Response(status=501)
    if request.method == 'POST':
        return Response(status=501)


@app.route('/appointments/<appointment>', methods=['GET', 'DELETE', 'POST'])
def appointment(appointment):
    if request.method == 'GET':
        return Response(status=501)
    if request.method == 'DELETE':
        return Response(status=501)


@app.route('/clients', methods=['GET', 'POST'])
def client_list():
    if request.method == 'GET':
        return Response(status=501)
    if request.method == 'POST':
        return Response(status=501)


@app.route('/clients/<client>', methods=['GET', 'DELETE', 'POST'])
def client(client):
    if request.method == 'GET':
        return Response(status=501)
    if request.method == 'DELETE':
        return Response(status=501)


@app.route('/clients/<client>/history', methods=['GET'])
def client(client):
    if request.method == 'GET':
        return Response(status=501)


@app.route('/vehicles', methods=['GET', 'POST'])
def vehicle_list():
    if request.method == 'GET':
        return Response(status=501)
    if request.method == 'POST':
        return Response(status=501)


@app.route('/vehicles/<vehicle>', methods=['GET', 'DELETE', 'POST'])
def vehicle(vehicle):
    if request.method == 'GET':
        return Response(status=501)
    if request.method == 'DELETE':
        return Response(status=501)


@app.route('/vehicles/<vehicle>/history', methods=['GET'])
def vehicle(vehicle):
    if request.method == 'GET':
        return Response(status=501)


@app.route('/services', methods=['GET', 'DELETE', 'POST'])
def services_list():
    if request.method == 'GET':
        return Response(status=501)
    if request.method == 'POST':
        return Response(status=501)


@app.route('/services/<service>', methods=['GET', 'DELETE', 'POST'])
def service(service):
    if request.method == 'GET':
        return Response(status=501)
    if request.method == 'DELETE':
        return Response(status=501)
