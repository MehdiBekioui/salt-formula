{% set fs = pillar['fs'] %}

{% for name, conf in salt['pillar.get']('tomcats:instances', {}).items() %}
  {% set pid = fs.tomcatDir + '/' + name + '/run/' + name + '.pid' %}

{{ fs.tomcatDir }}/{{ name }}/bin/startup.sh:
  cmd.run:
    - unless: test -f {{ pid }} && test -d /proc/$(cat {{ pid }})

{% endfor %}