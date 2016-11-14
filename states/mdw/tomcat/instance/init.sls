{% set fs = pillar['fs'] %}

include:
  - fs.create.instance

{% for instance, conf in salt['pillar.get']('tomcats:instances', {}).items() %}
  {% set instanceDir = fs.tomcatDir + '/' + instance %}

{{ instanceDir }}.instance:
  file.recurse:
    - name: {{ instanceDir }}
    - source: salt://mdw/tomcat/instance/files
    - include_empty: true
    - exclude_pat: E@(.empty)
    - file_mode: 755
    - template: jinja
    - context:
        name: {{ instance }}
        conf: {{ conf }}
        catalinaHome: {{ fs.installDir }}/{{ conf.mdw.tomcatAlias }}
        catalinaBase: {{ instanceDir }}
        javaHome: {{ fs.installDir }}/{{ conf.mdw.jdkAlias }}
  {% if 'catalinaOpts' in conf %}
        catalinaOpts: {{ conf.catalinaOpts|join(' ') }}
  {% else %}
        catalinaOpts: ''
  {% endif %}

  {% if 'lib' in conf %}
    {% for libName, libSource in conf.lib.items() %}

{{ instanceDir }}/lib/{{ libName }}:
  file.managed:
    - source: {{ libSource }}

     {% endfor %}
  {% endif %}

{% endfor %}