local parameter = import 'parameters/main.libsonnet';
local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.appointment,
  ],
  summary: 'Get Scheduled Service for Appointment.',
  description: '',
  operationId: 'scheduled-service',
  responses: response.scheduled_service,
  parameters: [
    parameter.appointment_id,
  ],
};

{
  url:: '/appointments/{appointment_id}/service',
  get: get,
}
