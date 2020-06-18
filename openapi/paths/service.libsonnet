local parameter = import 'parameters/main.libsonnet';
local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.service,
  ],
  summary: 'Get Service Information.',
  description: '',
  operationId: 'service-id',
  responses: response.service,
  parameters: [
    parameter.service_id,
  ],
};

local delete = {
  tags: ['service'],
  summary: 'Delete a service.',
  description: '',
  operationId: 'service-delete',
  responses: response.service_delete,
  parameters: [
    parameter.service_id,
  ],
};

{
  url:: '/services/{service_id}',
  get: get,
  delete: delete,
}
