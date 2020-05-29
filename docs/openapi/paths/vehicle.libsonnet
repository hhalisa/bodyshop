local parameter = import 'parameters/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.vehicle,
  ],
  summary: 'Get information on a vehicle.',
  description: '',
  operationId: 'vehicle_id',
  parameters: [
    parameter.vehicle_id,
  ],
  responses: {},
};

local delete = {
  tags: ['vehicle'],
  summary: 'Delete a vehicle.',
  description: '',
  operationId: 'vehicle_del',
  responses: {},
  parameters: [
    parameter.vehicle_id,
  ],
};

{
  url:: '/vehicles/{vehicle_id}',
  get: get,
  delete: delete,
}
