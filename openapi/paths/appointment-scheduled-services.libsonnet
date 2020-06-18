local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.appointment,
  ],
  summary: 'Scheduled Services.',
  description: '',
  operationId: 'appointment-scheduled-service',
  responses: response.appointment_scheduled_services,
};


{
  url:: '/appointments/{appointment}/services',
  get: get,
}
