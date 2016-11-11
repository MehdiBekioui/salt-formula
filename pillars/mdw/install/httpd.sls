{% set version = '2.4.23' %}

httpds:
  installs:
    httpd:
      version: {{ version }}
      source:
        url: salt://deliveries/middleware/httpd-{{ version }}.tar.gz
        md5: b711ea7d8b75dc8bfdf5a5d7e5253088