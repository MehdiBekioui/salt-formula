{% from 'mdw/common/install.sls' import installMdw %}
{{ installMdw('tomcats','tomcat','apache-tomcat-') }}