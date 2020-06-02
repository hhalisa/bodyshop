local parameter = import 'parameters/main.libsonnet';
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
  responses: {},
};

local delete = {
  tags: ['appointment'],
  summary: 'Delete appointment.',
  description: '',
  operationId: 'appointment_del',
  parameters: [
    parameter.appointment_id,
  ],
  responses: {},
};

{
  url:: '/appointments/{appointment_id}',
  get: get,
  delete: delete,
}
