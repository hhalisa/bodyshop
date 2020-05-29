local parameter = import 'parameters/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.client,
  ],
  summary: 'Get Client Information.',
  description: '',
  operationId: 'client',
  responses: {},
  parameters: [
    parameter.client_id,
  ],
};

local delete = {
  tags: ['client'],
  summary: 'Delete a client.',
  description: '',
  operationId: 'client_del',
  responses: {},
  parameters: [
    parameter.client_id,
  ],
};

{
  url:: '/clients/{client_id}',
  get: get,
  delete: delete,
}
