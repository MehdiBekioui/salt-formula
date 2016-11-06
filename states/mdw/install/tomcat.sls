{% from 'mdw/install/init.sls' import installMdw %}
{{ installMdw('tomcats','tomcat','apache-tomcat-') }}