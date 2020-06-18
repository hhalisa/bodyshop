local request = import 'requests/main.libsonnet';
local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.appointment,
  ],
  summary: 'List of all Appointments.',
  description: '',
  operationId: 'appointment-list',
  responses: response.appointment_list,
};

local post = {
  tags: [
    tag.appointment,
  ],
  summary: 'Schedule an appointment.',
  description: '',
  operationId: 'appointment-create',
  responses: response.appointment_create,
  requestBody: request.appointment,
};

{
  url:: '/appointments',
  get: get,
  post: post,
}
