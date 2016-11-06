export JAVA_HOME={{ installDir }}/{{ conf.mdw.jdkAlias }}
export JRE_HOME=$JAVA_HOME/jre

{% if conf.mdw.jdkAlias == 'jdk7' %}
  {% set permGenOption = '-XX:MaxPermSize=1G' %}
{% elif conf.mdw.jdkAlias == 'jdk8' %}
  {% set permGenOption = '-XX:MetaspaceSize=1G' %}
{% endif %}
export CATALINA_OPTS="-server -Xms1G -Xmx1G {{ permGenOption }}"