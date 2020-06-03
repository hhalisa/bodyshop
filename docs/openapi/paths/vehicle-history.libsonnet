local parameter = import 'parameters/main.libsonnet';
local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.vehicle,
  ],
  summary: 'Get Vehicle Service History.',
  description: '',
  operationId: 'vehicle-hist',
  responses: response.vehicle_history,
  parameters: [
    parameter.vehicle_id,
  ],
};

{
  url:: '/vehicles/{vehicle_id}/history',
  get: get,
}
