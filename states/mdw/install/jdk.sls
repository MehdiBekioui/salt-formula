{% from 'mdw/install/init.sls' import installMdw %}
{{ installMdw('jdks','jdk','jdk') }}