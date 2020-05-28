local path = import 'paths/main.libsonnet';

local active_paths = [
  path.appt,
  path.appt_list,
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

{ 'openapi.json': std.manifestJson(openapi) }
