local request = import 'requests/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.appointment,
  ],
  summary: 'List of all Appointments.',
  description: '',
  operationId: 'appointment-list',
  responses: {},
};

local post = {
  tags: [
    tag.appointment,
  ],
  summary: 'Schedule an appointment.',
  description: '',
  operationId: 'appointment_scheduled',
  responses: {},
  requestBody: [
    request.appointment_request_body,
  ],
};

{
  url:: '/appointments',
  get: get,
  post: post,
}
