local info = {
  description: |||
    This app allows persons to schedule, edit or delete
    appointments made for vehicle maintenance at the Bodyshop
  |||,
  version: '1.0.0',
  title: 'Bodyshop',
  contact: 'haleyhart123@gmail.com',
  name: 'Haley Hartsaw',
};

local tags = [
  { name: 'appointment' },
  { name: 'client' },
  { name: 'vehicle' },
  { name: 'service' },
];

local path_appointment_list = {
  get: {
    tags: ['appointment'],
    summary: 'List of all Appointments.',
    description: '',
    operationId: 'appointment-list',
    responses: {},
  },
};

local path_appointment = {
  get: {
    tags: ['appointment'],
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
  },
};

local path_client_list = {
  get: {
    tags: ['client'],
    summary: 'List of all Clients.',
    description: '',
    operationId: 'client-list',
  },
};

local path_client_id = {
  get: {
    tags: ['client'],
    summary: 'Get Client Information.',
    description: '',
    operationId: 'client',
    parameters: [
      {
        name: 'client_id',
        'in': 'path',
        description: 'Client ID.',
        required: true,
        schema: { type: 'integer' },
      },
    ],
  },
};

local paths = {
  '/appointments': path_appointment_list,
  '/appointments/{appointment_id}': path_appointment,
  '/clients': path_client_list,
  '/clients/{client_id}': path_client_id,
  //  '/vehicles': path_vehicle_list,
  //  '/vehicles/{vehicle_id}': path_vehicle_id,
  //  '/services': path_service_list,
  //  '/services/{service_id}': path_service_id,
};

{
  'openapi.json': std.manifestJson({
    openapi: '3.0.0',
    info: info,
    tags: tags,
    paths: paths,
  }),
}
