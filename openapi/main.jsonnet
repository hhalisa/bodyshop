local path = import 'paths/main.libsonnet';

local active_paths = [
  path.appt,
  path.appt_list,
  path.client,
  path.client_list,
  path.service,
  path.service_list,
  path.vehicle,
  path.vehicle_list,
  path.vehicle_history,
  path.client_history,
  path.appt_scheduled_services,
];

local info = {
  description: |||
    This app allows persons to schedule, edit or delete
    appointments made for vehicle maintenance at the Bodyshop
  |||,
  version: '1.0.0',
  title: 'Bodyshop',
  contact: {
    email: 'haleyhart123@gmail.com',
    name: 'Haley Hartsaw',
  },
};

local openapi = {
  openapi: '3.0.0',
  info: info,
  paths: {
    [path.url]: path
    for path in active_paths
  },
};

local validation_config = {
  lint: {
    rules: {
      'operation-tags-defined': 'off',
    },
  },
};

{
  '.redocly.json': std.manifestJson(validation_config),
  'openapi.json': std.manifestJson(openapi),
}
