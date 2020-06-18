local parameter = import 'parameters/main.libsonnet';
local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.appointment,
  ],
  summary: 'Get Appointment Information.',
  description: '',
  operationId: 'appointment',
  parameters: [
    parameter.appointment_id,
  ],
  responses: response.appointment,
};

local delete = {
  tags: ['appointment'],
  summary: 'Delete appointment.',
  description: '',
  operationId: 'appointment-delete',
  parameters: [
    parameter.appointment_id,
  ],
  responses: response.appointment_delete,
};

{
  url:: '/appointments/{appointment_id}',
  get: get,
  delete: delete,
}
