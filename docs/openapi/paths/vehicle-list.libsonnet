local request = import 'requests/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.vehicle,
  ],
  summary: 'Get a list of all vehicles.',
  description: '',
  operationId: 'vehicle_list',
  responses: {},
};

local post = {
  tags: ['vehicle'],
  summary: 'Add a vehicle.',
  description: '',
  operationId: 'vehicle_add',
  responses: {},
  requestBody: [
    request.vehicle_request_body,
  ],
};

{
  url:: '/vehicles',
  get: get,
  post: post,
}
