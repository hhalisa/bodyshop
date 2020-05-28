local tag = import 'tags/main.libsonnet';

{
  url:: '/vehicles/{vehicle_id}',
  get: {
    tags: [
      tag.vehicle,
    ],
    summary: 'Get information on a vehicle.',
    description: '',
    operationId: 'vehicle_id',
    parameters: [
      {
        name: 'vehicle_id',
        'in': 'path',
        description: 'Vehicle ID.',
        required: true,
        schema: { type: 'integer' },
      },
    ],
    responses: {},
  },
}
