{% set fs = pillar['fs'] %}
# Get jdk version
{% set instances = salt['pillar.get']('tomcats:instances', {}).items() %}

include:
  - fs.create.instance

{% for instance, conf in instances %}
  {% set instanceDir = fs.instancePath + '/tomcat/' + instance %}

{{ instanceDir }}.instance:
  file.recurse:
    - name: {{ instanceDir }}
    - source: salt://mdw/instance/tomcat/files
    - include_empty: true
    - file_mode: 755
    - template: jinja
    - context:
        name: {{ instance }}
        conf: {{ conf }}
        installDir: {{ fs.installPath }}
        instanceDir: {{ instanceDir }}

  {% if 'lib' in conf %}
    {% for libName, libSource in conf.lib.items() %}

{{ instanceDir }}/lib/{{ libName }}:
  file.managed:
    - source: {{ libSource }}

     {% endfor %}
  {% endif %}

{% endfor %}