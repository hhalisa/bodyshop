{
  appointment:
    {
      description: 'Create an Appointment',
      content: {
        'application/json': {
          schema: {
            type: 'object',
            properties: {
              appointment_id: { type: 'string' },
              vehicle_id: { type: 'string' },
              service_id: { type: 'string' },
              service_date: { type: 'string' },
              service_time: { type: 'string' },
            },
          },
        },
      },
    },
  client:
    {
      description: 'Create a Client',
      content: {
        'application/json': {
          schema: {
            type: 'object',
            properties: {
              client_id: { type: 'string' },
              client_fname: { type: 'string' },
              client_lname: { type: 'string' },
              client_phone: { type: 'string' },
            },
          },
        },
      },
    },
  service:
    {
      description: 'Create a Service',
      content: {
        'application/json': {
          schema: {
            type: 'object',
            properties: {
              service_id: { type: 'string' },
              service_type: { type: 'string' },
              service_price: { type: 'string' },
            },
          },
        },
      },
    },
  vehicle:
    {
      description: 'Create a Vehicle',
      content: {
        'application/json': {
          schema: {
            type: 'object',
            properties: {
              client_id: { type: 'string' },
              vehicle_id: { type: 'string' },
              vehicle_make: { type: 'string' },
              vehicle_model: { type: 'string' },
              vehicle_year: { type: 'string' },
              vehicle_milage: { type: 'string' },
            },
          },
        },
      },
    },
}
