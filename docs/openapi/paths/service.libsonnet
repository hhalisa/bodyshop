local tag = import 'tags/main.libsonnet';

{
  url:: '/services/{service_id}',
  get: {
    tags: [
      tag.service,
    ],
    summary: 'Get information on a service.',
    description: '',
    operationId: 'service_id',
    parameters: [
      {
        name: 'service_id',
        'in': 'path',
        description: 'Service ID.',
        required: true,
        schema: { type: 'integer' },
      },
    ],
    responses: {},
  },
}
