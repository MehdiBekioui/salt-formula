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

  {% if 'extra' in conf %}
    {% for fileName, content in conf.extra.items() %}

{{ instanceDir }}/conf/extra/{{ fileName }}:
  file.managed:
    - contents_pillar: httpds:instances:{{ instance }}:extra:{{ fileName }}
    - makedirs: true

    {% endfor %}
  {% endif %}

{% endfor %}  