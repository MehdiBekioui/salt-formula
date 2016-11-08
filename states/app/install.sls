{% set fs = pillar['fs'] %}
{% set deliveryRootDir = fs.instancePath + '/.delivery' %}

include:
  - fs.create.instance

{{ deliveryRootDir }}:
  file.directory

{% for name, conf in pillar['delivery'].items() %}
  {% set deliveryDir = deliveryRootDir + '/' + name %}
  {% set deliveryArch = conf.prefix + '-' + conf.name + '-' + conf.version + '.tar.gz' %}
  {% set deliveryWar = conf.prefix + '-' + conf.content.name + '-' + conf.version + '.war' %}

{{ deliveryDir }}:
  file.directory:
    - require:
      - file: {{ deliveryRootDir }}

{{ deliveryDir }}.extract:
  archive.extracted:
    - name: {{ deliveryDir }}
    - source: salt://deliveries/app/{{ name }}/{{ deliveryArch }}
    - if_missing: {{ deliveryDir }}/{{ deliveryWar }}
    - archive_format: tar
    - tar_options: xf
    - require:
      - file: {{ deliveryDir }}

{% for tomcatInstance in salt['grains.get']('roles:app:' + name, []) %}
  {% set webappDir = fs.tomcatDir + '/' + tomcatInstance + '/webapps/' + name %}
  {% set warFile = webappDir + '/' + deliveryWar %}

{{ webappDir }}:
  file.directory:
    - require:
      - archive: {{ deliveryDir }}.extract

{{ warFile }}.copy:
  file.copy:
    - name: {{ warFile }}
    - source: {{ deliveryDir }}/{{ deliveryWar }}
    - require:
      - file: {{ webappDir }}

{{ warFile }}.extract:
  archive.extracted:
    - name: {{ webappDir }}
    - source: {{ warFile }}
    - if_missing: {{ webappDir }}/WEB-INF
    - archive_format: zip
    - require:
      - file: {{ warFile }}.copy

{{ warFile }}.delete:
  file.absent:
    - name: {{ warFile }}
    - require:
      - archive: {{ warFile }}.extract

{% endfor %}

{% endfor %}