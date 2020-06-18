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
        req_body = request.get_json()
        resp_body = models.create_appointment(
            db, req_body['appointment_date'], req_body['appointment_id'],
            req_body['appointment_time'], req_body['vehicle_id'],
            req_body['app_service_id'], req_body['service_id'])
        return jsonify(resp_body)


@app.route('/appointments/<appointment>', methods=['HEAD', 'GET', 'DELETE'])
def appointment(appointment):
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_appointment(db, appointment)
        return jsonify(body)
    if request.method == 'DELETE':
        body = models.delete_appointment(db, appointment)
        return Response(status=200)


@app.route('/appointments/<appointment>/service', methods=['HEAD', 'GET'])
def appointment_service(appointment):
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_scheduled_service(db, appointment)
        return jsonify(body)


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


@ app.route('/clients/<client>', methods=['HEAD', 'GET', 'DELETE'])
def client(client):
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_client(db, client)
        return jsonify(body)
    if request.method == 'DELETE':
        body = models.delete_client(db, client)
        return Response(status=200)


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
        req_body = request.get_json()
        resp_body = models.create_vehicle(
            db, req_body['client_id'], req_body['vehicle_id'],
            req_body['vehicle_make'], req_body['vehicle_milage'], req_body['vehicle_model'], req_body['vehicle_year'])
        return jsonify(resp_body)


@ app.route('/vehicles/<vehicle>', methods=['HEAD', 'GET', 'DELETE'])
def vehicle(vehicle):
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_vehicle(db, vehicle)
        return jsonify(body)
    if request.method == 'DELETE':
        body = models.delete_vehicle(db, vehicle)
        return Response(status=200)


@ app.route('/vehicles/<vehicle>/history', methods=['HEAD', 'GET'])
def vehicle_history(vehicle):
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_vehicle_history(db, vehicle)
        return jsonify(body)


@ app.route('/services', methods=['HEAD', 'GET', 'POST'])
def service_list():
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_service_list(db)
        return jsonify(body)
    if request.method == 'POST':
        req_body = request.get_json()
        resp_body = models.create_service(
            db, req_body['service_id'], req_body['service_type'],
            req_body['service_price'])
        return jsonify(resp_body)


@ app.route('/services/<service>', methods=['HEAD', 'GET', 'DELETE'])
def service(service):
    db = get_db()
    if request.method == 'HEAD':
        return Response(status=501)
    if request.method == 'GET':
        body = models.get_service(db, service)
        return jsonify(body)
    if request.method == 'DELETE':
        body = models.delete_service(db, service)
        return Response(status=200)
