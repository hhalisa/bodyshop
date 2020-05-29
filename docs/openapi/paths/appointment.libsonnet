local tag = import 'tags/main.libsonnet';

{
  url:: '/appointment/{appointment_id}',
  get: {
    tags: [
      tag.appointment,
    ],
    summary: 'Get Appointment Information.',
    description: '',
    operationId: 'appointment',
    parameters: [
      {
        name: 'appointment_id',
        'in': 'path',
        description: 'ID of Appointment made.',
        required: true,
        schema: { type: 'integer' },
      },
    ],
    responses: {},
  },
}
