{% set version = '8.5.6' %}

tomcats:
  installs:
    tomcat8:
      version: {{ version }}
      source:
        url: salt://deliveries/middleware/apache-tomcat-{{ version }}.tar.gz
        md5: e273e27deb1828ae5f19374616b9fba8