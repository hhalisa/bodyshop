local request = import 'requests/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.client,
  ],
  summary: 'List of all Clients.',
  description: '',
  operationId: 'client-list',
  responses: {},
};

local post = {
  tags: ['client'],
  summary: 'Create a client.',
  description: '',
  operationId: 'client_create',
  responses: {},
  requestBody: [
    request.client_request_body,
  ],
};

{
  url:: '/clients',
  get: get,
  post: post,
}
