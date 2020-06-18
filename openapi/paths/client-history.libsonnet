local parameter = import 'parameters/main.libsonnet';
local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.client,
  ],
  summary: 'Get Client History.',
  description: '',
  operationId: 'client-history',
  responses: response.client_history,
  parameters: [
    parameter.client_id,
  ],
};

{
  url:: '/clients/{client_id}/history',
  get: get,
}
