{% set rootDir = grains['fs'] %}
{% set instanceDir = rootDir + '/srv' %}

fs:
  rootPath: {{ rootDir }}
  installPath: {{ rootDir }}/opt
  instancePath: {{ instanceDir }}
  tomcatDir: {{ instanceDir }}/tomcat