{% from 'mdw/common/stop.sls' import stopMdw %}
{{ stopMdw('tomcats:instances', pillar['fs'].tomcatDir) }}