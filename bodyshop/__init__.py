from flask import Flask, request, Response, jsonify
from bodyshop.db import get_db
from bodyshop import models
import json

__version__ = '0.1.0'

app = Flask(__name__)


@app.route('/appointments', methods=['HEAD', 'GET', 'POST'])
def appointment_list():
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_appointment_list(db)
        return jsonify(body)
    if request.method == 'POST':
        return Response(status=501)


@app.route('/appointments/<appointment>', methods=['HEAD', 'GET', 'DELETE', 'POST'])
def appointment(appointment):
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_appointment(db, appointment)
        return jsonify(body)
    if request.method == 'DELETE':
        return Response(status=501)


@app.route('/clients', methods=['HEAD', 'GET', 'POST'])
def client_list():
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_client_list(db)
        return jsonify(body)
    if request.method == 'POST':
        req_body = request.get_json()
        resp_body = models.create_client(
            db, req_body['client_id'], req_body['client_fname'],
            req_body['client_lname'], req_body['client_phone'])
        return jsonify(resp_body)
        # return Response(status=501)


@ app.route('/clients/<client>', methods=['HEAD', 'GET', 'DELETE', 'POST'])
def client(client):
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_client(db, client)
        return jsonify(body)
    if request.method == 'DELETE':
        return Response(status=501)


@ app.route('/clients/<client>/history', methods=['HEAD', 'GET'])
def client_history(client):
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_client_history(db, client)
        return jsonify(body)


@ app.route('/vehicles', methods=['HEAD', 'GET', 'POST'])
def vehicle_list():
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_vehicle_list(db)
        return jsonify(body)
    if request.method == 'POST':
        return Response(status=501)


@ app.route('/vehicles/<vehicle>', methods=['HEAD', 'GET', 'DELETE', 'POST'])
def vehicle(vehicle):
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_vehicle(db, vehicle)
        return jsonify(body)
    if request.method == 'DELETE':
        return Response(status=501)


@ app.route('/vehicles/<vehicle>/history', methods=['HEAD', 'GET'])
def vehicle_history(vehicle):
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_vehicle_history(db, vehicle)
        return jsonify(body)


@ app.route('/services', methods=['HEAD', 'GET', 'DELETE', 'POST'])
def service_list():
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_service_list(db)
        return jsonify(body)
    if request.method == 'POST':
        return Response(status=501)


@ app.route('/services/<service>', methods=['HEAD', 'GET', 'DELETE', 'POST'])
def service(service):
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_service(db, service)
        return jsonify(body)
    if request.method == 'DELETE':
        return Response(status=501)
#    app.config.from_mapping(
#        SECRET_KEY='dev',
#        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
#    )
