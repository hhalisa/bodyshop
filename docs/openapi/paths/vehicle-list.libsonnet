local request = import 'requests/main.libsonnet';
local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.vehicle,
  ],
  summary: 'List of all Vehicles.',
  description: '',
  operationId: 'vehicle-list',
  responses: response.vehicle_list,
};

local post = {
  tags: ['vehicle'],
  summary: 'Create a vehicle.',
  description: '',
  operationId: 'vehicle-create',
  responses: response.vehicle_create,
  requestBody: request.vehicle,
};

{
  url:: '/vehicles',
  get: get,
  post: post,
}
