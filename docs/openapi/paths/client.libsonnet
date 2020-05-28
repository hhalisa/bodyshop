local tag = import 'tags/main.libsonnet';

{
  url:: '/clients/{client_id}',
  get: {
    tags: [
      tag.client,
    ],
    summary: 'Get Client Information.',
    description: '',
    operationId: 'client',
    responses: {},
    parameters: [
      {
        name: 'client_id',
        'in': 'path',
        description: 'Client ID.',
        required: true,
        schema: { type: 'integer' },
      },
    ],
  },
}
