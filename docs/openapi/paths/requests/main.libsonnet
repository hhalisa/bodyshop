{
  appointment_request_body: [
    {
      description: 'Schedule an Appointment',
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
  ],
  client_request_body: [
    {
      description: 'Create a Client',
      content: {
        'application/json': {
          schema: {
            type: 'object',
            properties: {
              client_id: { type: 'string' },
              client_name: { type: 'string' },
              client_phone: { type: 'string' },
            },
          },
        },
      },
    },
  ],
  service_request_body: [
    {
      description: 'Add a Service',
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
  ],
  vehicle_request_body: [
    {
      description: 'Add a Vehicle',
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
  ],
}
