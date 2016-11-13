base:
  '*':
    - fs
  'G@roles:mdw:jdk7':
    - mdw.install.jdk7
  'G@roles:mdw:jdk8':
    - mdw.install.jdk8
  'G@roles:mdw:tomcat7':
    - mdw.install.tomcat7
  'G@roles:mdw:tomcat8':
    - mdw.install.tomcat8
  'G@roles:mdw:httpd':
    - mdw.install.httpd
  'G@roles:app':
    - app.versions
    - app.delivery
  'G@roles:app:usr':
    - mdw.instance.tomcat8-usr
    - mdw.instance.httpd-usr