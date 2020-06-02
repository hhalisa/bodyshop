local request = import 'requests/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.service,
  ],
  summary: 'Get a list of all services.',
  description: '',
  operationId: 'service_list',
  responses: {},
};

local post = {
  tags: ['service'],
  summary: 'Add a service.',
  description: '',
  operationId: 'service_add',
  responses: {},
  requestBody: [
    request.service_request_body,
  ],
};

{
  url:: '/services',
  get: get,
  post: post,
}
