local tag = import 'tags/main.libsonnet';

{
  url:: '/appointments',
  get: {
    tags: [
      tag.appointment,
    ],
    summary: 'List of all Appointments.',
    description: '',
    operationId: 'appointment-list',
    responses: {},
  },
}
