local parameter = import 'parameters/main.libsonnet';
local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.vehicle,
  ],
  summary: 'Get information on a vehicle.',
  description: '',
  operationId: 'vehicle-id',
  responses: response.vehicle,
  parameters: [
    parameter.vehicle_id,
  ],
};

local delete = {
  tags: ['vehicle'],
  summary: 'Delete a vehicle.',
  description: '',
  operationId: 'vehicle-delete',
  responses: response.vehicle_delete,
  parameters: [
    parameter.vehicle_id,
  ],
};

{
  url:: '/vehicles/{vehicle_id}',
  get: get,
  delete: delete,
}
