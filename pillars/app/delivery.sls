{% from 'app/versions.sls' import versions %}

delivery:
  usr:
    prefix: naeyil-usr
    version: {{ versions.naeyil.usr }}
    name: delivery
    type: archive
    content:
      name: webapp-backend
      type: war