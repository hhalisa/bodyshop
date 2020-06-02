local request = import 'requests/main.libsonnet';
local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.service,
  ],
  summary: 'Get a list of all services.',
  description: '',
  operationId: 'service-list',
  responses: response.service_list,
};

local post = {
  tags: ['service'],
  summary: 'Create a service.',
  description: '',
  operationId: 'service-create',
  responses: response.service_create,
  requestBody: request.service,
};

{
  url:: '/services',
  get: get,
  post: post,
}
