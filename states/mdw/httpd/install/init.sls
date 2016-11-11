{% from 'mdw/common/install.sls' import installMdw %}
{{ installMdw('httpds','httpd','httpd-') }}