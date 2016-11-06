{% set version = '7.0.72' %}

tomcats:
  installs:
    tomcat7:
      version: {{ version }}
      source:
        url: salt://deliveries/middleware/apache-tomcat-{{ version }}.tar.gz
        md5: c24bfae15bb9c510451a05582aae634d