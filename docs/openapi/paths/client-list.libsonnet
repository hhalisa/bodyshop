local tag = import 'tags/main.libsonnet';
{
  url:: '/clients',
  get: {
    tags: [
      tag.client,
    ],
    summary: 'List of all Clients.',
    description: '',
    operationId: 'client-list',
    responses: {},
  },
}
