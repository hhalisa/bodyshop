local parameter = import 'parameters/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.service,
  ],
  summary: 'Get information on a service.',
  description: '',
  operationId: 'service_id',
  parameters: [
    parameter.service_id,
  ],
  responses: {},
};

local delete = {
  tags: ['service'],
  summary: 'Delete a service.',
  description: '',
  operationId: 'service_del',
  responses: {},
  parameters: [
    parameter.service_id,
  ],
};

{
  url:: '/services/{service_id}',
  get: get,
  delete: delete,
}
