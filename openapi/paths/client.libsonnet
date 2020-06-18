local parameter = import 'parameters/main.libsonnet';
local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.client,
  ],
  summary: 'Get Client Information.',
  description: '',
  operationId: 'client',
  responses: response.client,
  parameters: [
    parameter.client_id,
  ],
};

local delete = {
  tags: ['client'],
  summary: 'Delete a client.',
  description: '',
  operationId: 'client-delete',
  responses: response.client_delete,
  parameters: [
    parameter.client_id,
  ],
};

{
  url:: '/clients/{client_id}',
  get: get,
  delete: delete,
}
