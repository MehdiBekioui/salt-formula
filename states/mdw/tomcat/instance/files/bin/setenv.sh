export JAVA_HOME={{ javaHome }}
export JRE_HOME=$JAVA_HOME/jre

export CATALINA_PID=$CATALINA_BASE/run/{{ name }}.pid
export CATALINA_OPTS="{{ catalinaOpts }}"