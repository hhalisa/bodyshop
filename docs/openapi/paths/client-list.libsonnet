local request = import 'requests/main.libsonnet';
local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.client,
  ],
  summary: 'List of all Clients.',
  description: '',
  operationId: 'client-list',
  responses: response.client_list,
};

local post = {
  tags: ['client'],
  summary: 'Create a client.',
  description: '',
  operationId: 'client-create',
  responses: response.client_create,
  requestBody: request.client,
};

{
  url:: '/clients',
  get: get,
  post: post,
}
