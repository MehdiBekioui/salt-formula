{% set fs = pillar['fs'] %}

include:
  - fs.create.instance

{% for instance, conf in salt['pillar.get']('httpds:instances', {}).items() %}
  {% set instanceDir = fs.instanceDir + '/httpd/' + instance %}

{{ instanceDir }}.instance:
  file.recurse:
    - name: {{ instanceDir }}
    - source: salt://mdw/httpd/instance/files
    - include_empty: true
    - exclude_pat: E@(.empty)
    - file_mode: 755
    - template: jinja
    - context:
        conf: {{ conf }}
        installDir: {{ fs.installDir }}/httpd
        instanceDir: {{ instanceDir }}

{% endfor %}  