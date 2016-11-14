{% macro stopMdw(instances, instanceMdwDir) %}
  {% for name, conf in salt['pillar.get'](instances, {}).items() %}
    {% set pid = instanceMdwDir + '/' + name + '/run/' + name + '.pid' %}

{{ instanceMdwDir }}/{{ name }}/bin/shutdown.sh:
  cmd.run:
    - onlyif: test -f {{ pid }} && test -d /proc/$(cat {{ pid }})

check.shutdown:
  cmd.run:
    - name: |
        i=1
        while [ $i -le 5 ]; do
          sleep 1
          pid=`ps -edf | grep {{ name }} | grep -v grep | awk '{print $2}'`
          if [ ! -z "$pid" ]; then kill -9 $pid; break; fi
          i=$((i+1))
        done
    - onlyif: test -f {{ pid }} && test -d /proc/$(cat {{ pid }})

  {% endfor %}
{% endmacro %}