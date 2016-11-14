{% set rootDir = grains['fs'] %}
{% set instanceDir = rootDir + '/srv' %}

fs:
  rootDir: {{ rootDir }}
  installDir: {{ rootDir }}/opt
  instanceDir: {{ instanceDir }}
  tomcatDir: {{ instanceDir }}/tomcat
  httpdDir: {{ instanceDir }}/httpd