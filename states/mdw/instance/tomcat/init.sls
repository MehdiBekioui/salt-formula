{% set fs = pillar['fs'] %}
# Get jdk version
{% set instances = salt['pillar.get']('tomcats:instances', {}).items() %}

include:
  - fs.create.instance

{% for instance, args in instances %}
  {% set instanceDir = fs.instancePath + '/tomcat/' + instance %}

tomcat-instance-directories:
  file.recurse:
    - name: {{ instanceDir }}
    - source: salt://mdw/instance/tomcat/files
    - include_empty: true
    - file_mode: 755
    - template: jinja
    - context:
        name: {{ instance }}
        conf: {{ args }}
        installDir: {{ fs.installPath }}
        instanceDir: {{ instanceDir }}
{% endfor %}