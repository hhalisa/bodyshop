local tag = import 'tags/main.libsonnet';

{
  url:: '/vehicles',
  get: {
    tags: [
      tag.vehicle,
    ],
    summary: 'Get a list of all vehicles.',
    description: '',
    operationId: 'vehicle_list',
    responses: {},
  },
}
