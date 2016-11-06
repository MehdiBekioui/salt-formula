{% set rootPath = grains['fs'] %}

fs:
  rootPath: {{ rootPath }}
  installPath: {{ rootPath }}/opt
  instancePath: {{ rootPath }}/srv