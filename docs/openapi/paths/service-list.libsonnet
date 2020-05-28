local tag = import 'tags/main.libsonnet';

{
  url:: '/services',
  get: {
    tags: [
      tag.service,
    ],
    summary: 'Get a list of all services.',
    description: '',
    operationId: 'service_list',
    responses: {},
  },
}
