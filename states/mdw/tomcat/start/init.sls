{% from 'mdw/common/start.sls' import startMdw %}
{{ startMdw('tomcats:instances', pillar['fs'].tomcatDir) }}