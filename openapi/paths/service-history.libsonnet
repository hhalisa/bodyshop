local parameter = import 'parameters/main.libsonnet';
local response = import 'response/main.libsonnet';
local tag = import 'tags/main.libsonnet';

local get = {
  tags: [
    tag.service,
  ],
  summary: 'Get Service History.',
  description: '',
  operationId: 'service-history',
  responses: response.service_history,
  parameters: [
    parameter.service_id,
  ],
};

{
  url:: '/services/{service_id}/history',
  get: get,
}



  service_history:
    {
      '200': {
        description: 'Service History Retrieved',
        content: {
          'application/json': {
            schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
              title: 'Service History',
              description: 'Service History',
              type: 'object',
              properties: {
                service: {
                  type: 'array',
                  items: {
                    type: 'string',
                  },
                },
                appointment: {
                  type: 'object',
                  properties: {
                    appointment_date: { type: 'string' },
                  },
                },
              },
            },
            example: [
              {
                service: [
                  'State Inspection',
                ],
                appointment: {
                  appointment_date: '2019-01-15',
                },
              },
              {
                service: [
                  'Oil Change',
                  'Fluid Check',
                  'Tire Rotation',
                ],
                appointment: {
                  appointment_date: '2020-03-02',
                },
              },
              {
                service: [
                  'State Inspection',
                ],
                appointment: {
                  appointment_date: '2020-03-09',
                },
              },
              {
                service: [
                  'Oil Change',
                  'Brake Pad Replacement',
                ],
                appointment: {
                  appointment_date: '2020-03-12',
                },
              },
              {
                service: [
                  'Oil Change',
                  'Fluid Check',
                  'Fluid Check',
                  'Oil Change',
                ],
                appointment: {
                  appointment_date: '2020-03-21',
                },
              },
              {
                service: [
                  'Brake Pad Replacement',
                  'Tire Rotation',
                  'State Inspection',
                  'Oil Change',
                  'Brake Pad Replacement',
                ],
                appointment: {
                  appointment_date: '2020-03-27',
                },
              },
              {
                service: [
                  'State Inspection',
                ],
                appointment: {
                  appointment_date: '2020-06-01',
                },
              },
            ],
          },
        },
      },
      '400': {
        description: 'Bad Request',
      },
    },
