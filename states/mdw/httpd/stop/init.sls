{% from 'mdw/common/stop.sls' import stopMdw %}
{{ stopMdw('httpds:instances', pillar['fs'].httpdDir) }}