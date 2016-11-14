{% macro startMdw(instances, instanceMdwDir) %}
  {% for name, conf in salt['pillar.get'](instances, {}).items() %}
    {% set pid = instanceMdwDir + '/' + name + '/run/' + name + '.pid' %}

{{ instanceMdwDir }}/{{ name }}/bin/startup.sh:
  cmd.run:
    - unless: test -f {{ pid }} && test -d /proc/$(cat {{ pid }})

  {% endfor %}
{% endmacro %}