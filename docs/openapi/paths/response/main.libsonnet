{
  appointment_list:
    {
      '200': {
        description: 'List of all Appointments:',
        content: {
          'application/json': {
            schema: {
              title: 'Appointment List',
              description: 'Appointment List',
              type: 'object',
              properties: {
                appointments: {
                  type: 'array',
                  items: {
                    type: 'object',
                    properties: {
                      appointment_id: { type: 'string' },
                      appointment_date: { type: 'string' },
                      client: {
                        type: 'array',
                        items: {
                          type: 'object',
                          properties: {
                            client_id: { type: 'string' },
                          },
                        },
                      },
                      vehicle: {
                        type: 'array',
                        items: {
                          type: 'object',
                          properties: {
                            vehicle_id: { type: 'string' },
                          },
                        },
                      },
                    },
                  },
                },
              },
              required: [
                'appointment_id',
              ],
            },
            example: {
              appointments: [
                {
                  appointment_date: '',
                  appointment_id: 'F889',
                  client: {
                    client_id: '11291',
                  },
                  vehicle: {
                    vehicle_id: '2995',
                  },
                },
                {
                  appointment_date: '',
                  appointment_id: 'F142',
                  client: {
                    client_id: '11021',
                  },
                  vehicle: {
                    vehicle_id: '6756',
                  },
                },
              ],
            },
          },
        },
      },
      '400': {
        description: 'Bad Request',
      },
    },
  appointment_create: {
    '201': {
      description: 'Appointment Successfully Created',
      content: {
        'application/json': {
          schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
            title: 'Appointment Scheduled',
            description: 'Appointment Scheduled',
            type: 'object',
            properties: {
              appointment_id: { type: 'string' },
            },
          },
        },
      },
    },
    '400': {
      description: 'Bad Request',
      headers: {
        'Content-Type': {
          description: 'Bad Type',
          required: true,
          schema: { type: 'string' },
        },
        'Content-Length': {
          description: 'Appointment ID of appointment to be created.',
          required: true,
          schema: { type: 'string' },
        },
        Date: {
          description: 'Appointment ID of appointment to be created.',
          required: true,
          schema: { type: 'string' },
        },
      },
    },
  },
  appointment:
    {
      '200': {
        description: 'Appointment Information Retrieved',
        content: {
          'application/json': {
            schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
              title: 'Appointment Info',
              description: 'Appointment Information',
              type: 'object',
              properties: {
                appointment_id: {
                  description: 'Unique Appointment ID',
                  type: 'string',
                },
                appointment_date: {
                  description: 'Date and time of scheduled appointment',
                  type: 'string',
                  format: 'date-time',
                },
                client: {
                  type: 'object',
                  properties: {
                    client_id: { type: 'string' },
                  },
                },
                vehicle: {
                  type: 'object',
                  properties: {
                    vehicle_id: { type: 'string' },
                  },
                },
              },
              required: [
                'appointment_id',
                'appointment_date',
                'client',
                'vehicle',
              ],
            },
            example: {
              appointment_id: 'F889',
              appointment_date: '2019-01-15T09:00:00+0000',
              client: {
                client_id: '11279',
              },
              vehicle: {
                vehicle_id: '2763',
              },
            },
          },
        },
      },
      '400': {
        description: 'Bad Request',
      },
    },
  appointment_delete: {
    '200': {
      description: 'Appointment Successfully Deleted',
      content: {
        'application/json': {
          schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
            title: 'Appointment Deleted',
            description: 'Appointment Deleted',
            type: 'object',
            properties: {
              appointment_id: { type: 'string' },
            },
          },
        },
      },
    },
    '400': {
      description: 'Bad Request',
    },
  },
  scheduled_service:
    {
      '200': {
        description: 'Appointment Services Retrieved',
        content: {
          'application/json': {
            schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
              title: 'Scheduled Service Info',
              description: 'Scheduled Service Information',
              type: 'object',
              properties: {
                service: {
                  type: 'array',
                  items: {
                    type: 'object',
                    properties: {
                      appointment_id: { type: 'string' },
                      service_type: { type: 'string' },
                      service_id: { type: 'string' },
                    },
                  },
                },
              },
              required: [
                'appointment_id',
              ],
            },
            example: {
              service: [
                {
                  appointment_id: 'F142',
                  service_type: 'Oil Change',
                  service_id: '10',
                },
                {
                  appointment_id: 'F142',
                  service_type: 'Fluid Check',
                  service_id: '11',
                },
                {
                  appointment_id: 'F142',
                  service_type: 'Tire Rotation',
                  service_id: '13',
                },
              ],
            },
          },
        },
      },
      '400': {
        description: 'Bad Request',
      },
    },
  client_list:
    {
      '200': {
        description: 'List of all Clients:',
        content: {
          'application/json': {
            schema: {
              title: 'Client List',
              description: 'Client List',
              type: 'object',
              properties: {
                clients: {
                  type: 'array',
                  items: {
                    type: 'object',
                    properties: {
                      client_id: { type: 'string' },
                      name: { type: 'string' },
                      phone: { type: 'string' },
                    },
                  },
                },
              },
              required: [
                'client_id',
              ],
            },
            example: {
              client: [
                {
                  client_id: '11291',
                  name: 'Deku Midoriya',
                  phone: '(999)222-8374',
                },
                {
                  client_id: '11021',
                  name: 'John Smith',
                  phone: '(555)676-9900',
                },
                {
                  client_id: '11010',
                  name: 'Sally Jones',
                  phone: '(555)666-7777',
                },
              ],
            },
          },
        },
      },
      '400': {
        description: 'Bad Request',
      },
    },
  client:
    {
      '200': {
        description: 'Client Information Retrieved',
        content: {
          'application/json': {
            schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
              title: 'Client Info',
              description: 'Client Information',
              type: 'object',
              properties: {
                client: {
                  type: 'object',
                  properties: {
                    client_id: { type: 'string' },
                    name: { type: 'string' },
                    phone: { type: 'string' },
                  },
                },
                vehicle: {
                  type: 'array',
                  items: {
                    type: 'object',
                    properties: {
                      vehicle_id: { type: 'string' },
                    },
                  },
                },
              },
              required: [
                'client_id',
              ],
            },
            example: {
              client: {
                client_id: '11021',
                name: 'John Smith',
                phone: '(555)676-9900',
              },
              vehicle: [
                {
                  vehicle_id: '6124',
                },
                {
                  vehicle_id: '6756',
                },
              ],
            },
          },
        },
      },
      '400': {
        description: 'Bad Request',
      },
    },
  client_history:
    {
      '200': {
        description: 'Client History Retrieved',
        content: {
          'application/json': {
            schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
              title: 'Client Info',
              description: 'Client History',
              type: 'object',
              properties: {
                client: {
                  type: 'object',
                  properties: {
                    client_id: { type: 'string' },
                  },
                },
                vehicle: {
                  type: 'array',
                  items: {
                    type: 'object',
                    properties: {
                      vehicle_id: { type: 'string' },
                      make: { type: 'string' },
                      model: { type: 'string' },
                      year: { type: 'string' },
                    },
                  },
                },
                service: {
                  type: 'array',
                  items: {
                    type: 'object',
                    items: {
                      type: 'string',
                    },
                  },
                },
                appointment: {
                  type: 'array',
                  items: {
                    type: 'object',
                    properties: {
                      appointment_date: { type: 'string' },
                    },
                  },
                },
              },
              required: [
                'client_id',
              ],
            },
            example: [
              {
                client: {
                  client_id: '11021',
                },
                vehicle: [
                  {
                    vehicle_id: '6124',
                    make: 'Honda',
                    model: 'Accord',
                    year: '2020',
                  },
                ],
                service: [
                  'State Inspection',
                ],
                appointment: {
                  appointment_date: '2020-03-09',
                },
              },
              {
                client: {
                  client_id: '11021',
                },
                vehicle: [
                  {
                    vehicle_id: '6756',
                    make: 'Toyota',
                    model: 'Camry',
                    year: '2013',
                  },
                ],
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
                client: {
                  client_id: '11021',
                },
                vehicle: [
                  {
                    vehicle_id: '6756',
                    make: 'Toyota',
                    model: 'Camry',
                    year: '2013',
                  },
                ],
                service: [
                  'State inspection',
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
  client_create: {
    '201': {
      description: 'Client Successfully Created',
      content: {
        'application/json': {
          schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
            title: 'Client Created',
            description: 'Client Created',
            type: 'object',
            properties: {
              client_id: { type: 'string' },
            },
          },
        },
      },
    },
    '400': {
      description: 'Bad Request',
    },
  },
  client_delete: {
    '200': {
      description: 'Client Successfully Deleted',
      content: {
        'application/json': {
          schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
            title: 'Client Deleted',
            description: 'Client Deleted',
            type: 'object',
            properties: {
              client_id: { type: 'string' },
            },
          },
        },
      },
    },
    '400': {
      description: 'Bad Request',
    },
  },
  service_list:
    {
      '200': {
        description: 'List of all Services:',
        content: {
          'application/json': {
            schema: {
              title: 'Service List',
              description: 'Service List',
              type: 'object',
              properties: {
                services: {
                  type: 'array',
                  items: {
                    type: 'object',
                    properties: {
                      service_id: { type: 'string' },
                      service_type: { type: 'string' },
                      price_in_dollars: { type: 'string' },
                    },
                  },
                },
              },
              required: [
                'service_id',
              ],
            },
            example: {
              service: [
                {
                  service_id: '20',
                  service_type: 'State Inspection',
                  price_in_dollars: '75',
                },
                {
                  service_id: '10',
                  service_type: 'Oil Change',
                  price_in_dollars: '50',
                },
                {
                  service_id: '11',
                  service_type: 'Fluid Check',
                  price_in_dollars: '20',
                },
                {
                  service_id: '13',
                  service_type: 'Tire Rotation',
                  price_in_dollars: '10',
                },
                {
                  service_id: '15',
                  service_type: 'Brake Pad Replacement',
                  price_in_dollars: '75',
                },
              ],
            },
          },
        },
      },
      '400': {
        description: 'Bad Request',
      },
    },
  service:
    {
      '200': {
        description: 'Service Information Retrieved',
        content: {
          'application/json': {
            schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
              title: 'Service Info',
              description: 'Service Information',
              type: 'object',
              properties: {
                service: {
                  type: 'object',
                  properties: {
                    service_id: { type: 'string' },
                    service_type: { type: 'string' },
                    price: { type: 'string' },
                  },
                },
              },
              required: [
                'service_id',
              ],
            },
            example: {
              service: {
                service_id: '20',
                service_type: 'State Inspection',
                price: '$75',
              },
            },
          },
        },
      },
      '400': {
        description: 'Bad Request',
      },
    },
  service_create: {
    '201': {
      description: 'Service Successfully Created',
      content: {
        'application/json': {
          schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
            title: 'Service Added',
            description: 'Service Added',
            type: 'object',
            properties: {
              service_id: { type: 'string' },
            },
          },
        },
      },
    },
    '400': {
      description: 'Bad Request',
    },
  },
  service_delete: {
    '200': {
      description: 'Service Successfully Deleted',
      content: {
        'application/json': {
          schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
            title: 'Service Deleted',
            description: 'Service Deleted',
            type: 'object',
            properties: {
              service_id: { type: 'string' },
            },
          },
        },
      },
    },
    '400': {
      description: 'Bad Request',
    },
  },
  vehicle_list:
    {
      '200': {
        description: 'List of all Vehicles:',
        content: {
          'application/json': {
            schema: {
              title: 'Vehicle List',
              description: 'Vehicle List',
              type: 'object',
              properties: {
                vehicles: {
                  type: 'array',
                  items: {
                    type: 'object',
                    properties: {
                      vehicle_id: { type: 'string' },
                      make: { type: 'string' },
                      model: { type: 'string' },
                      year: { type: 'string' },
                      client: {
                        type: 'array',
                        items: {
                          type: 'object',
                          properties: {
                            client_id: { type: 'string' },
                          },
                        },
                      },
                    },
                  },
                },
              },
              required: [
                'vehicle_id',
              ],
            },
            example: {
              vehicle: [
                {
                  vehicle_id: '2763',
                  make: 'Acura',
                  model: 'NSX',
                  year: '2021',
                  client: {
                    client_id: '11291',
                  },
                },
                {
                  vehicle_id: '6124',
                  make: 'Honda',
                  model: 'Accord',
                  year: '2020',
                  client: {
                    client_id: '11021',
                  },
                },
                {
                  vehicle_id: '6756',
                  make: 'Toyota',
                  model: 'Camry',
                  year: '2013',
                  client: {
                    client_id: '11021',
                  },
                },
              ],
            },
          },
        },
      },
      '400': {
        description: 'Bad Request',
      },
    },
  vehicle:
    {
      '200': {
        description: 'Vehicle Information Retrieved',
        content: {
          'application/json': {
            schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
              title: 'Vehicle Info',
              description: 'Vehicle Information',
              type: 'object',
              properties: {
                client: {
                  type: 'object',
                  properties: {
                    client_id: { type: 'string' },
                  },
                },
                vehicle: {
                  type: 'object',
                  properties: {
                    vehicle_id: { type: 'string' },
                    make: { type: 'string' },
                    model: { type: 'string' },
                    year: { type: 'string' },
                    milage: { type: 'string' },
                  },
                },
              },
              required: [
                'vehicle_id',
              ],
            },
            example: {
              client: {
                client_id: '11021',
              },
              vehicle: {
                vehicle_id: '6124',
                make: 'Honda',
                model: 'Accord',
                year: '2020',
                milage: '506',
              },
            },
          },
        },
      },
      '400': {
        description: 'Bad Request',
      },
    },
  vehicle_history:
    {
      '200': {
        description: 'Vehicle History Retrieved',
        content: {
          'application/json': {
            schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
              title: 'Vehicle History',
              description: 'Vehicle History',
              type: 'object',
              properties: {
                vehicle: {
                  type: 'object',
                  properties: {
                    vehicle_id: { type: 'string' },
                    make: { type: 'string' },
                    model: { type: 'string' },
                    year: { type: 'string' },
                  },
                },
                appointment: {
                  type: 'object',
                  properties: {
                    appointment_date: { type: 'string' },
                  },
                },
                service: {
                  type: 'array',
                  items: {
                    type: 'string',
                  },
                },
              },
              required: [
                'vehicle_id',
              ],
            },
            example: [
              {
                vehicle: {
                  vehicle_id: '6756',
                  make: 'Toyota ',
                  model: 'Camry',
                  year: '2013',
                },
                appointment: {
                  appointment_date: '2020-03-02',
                },
                service: [
                  'Fluid Check',
                  'Oil Change',
                  'Tire Rotation',
                ],
              },
              {
                vehicle: {
                  vehicle_id: '6756',
                  make: 'Toyota ',
                  model: 'Camry',
                  year: '2013',
                },
                appointment: {
                  appointment_date: '2020-06-01',
                },
                service: [
                  'State Inspection',
                ],
              },
            ],
          },
        },
      },
      '400': {
        description: 'Bad Request',
      },
    },
  vehicle_create: {
    '201': {
      description: 'Vehicle Successfully Created',
      content: {
        'application/json': {
          schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
            title: 'Vehicle Added',
            description: 'Vehicle Added',
            type: 'object',
            properties: {
              vehicle_id: { type: 'string' },
            },
          },
        },
      },
    },
    '400': {
      description: 'Bad Request',
    },
  },
  vehicle_delete: {
    '200': {
      description: 'Vehicle Successfully Deleted',
      content: {
        'application/json': {
          schema: {  //    '$schema': 'http://json-schema.org/draft-07/schema#',//    '$id': 'http://example.com/product.schema.json',
            title: 'Vehicle Deleted',
            description: 'Vehicle Deleted',
            type: 'object',
            properties: {
              vehicle_id: { type: 'string' },
            },
          },
        },
      },
    },
    '400': {
      description: 'Bad Request',
    },
  },
}
