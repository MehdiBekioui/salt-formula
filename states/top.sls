base:
  'G@roles:mdw:jdk*':
    - mdw.jdk.install
  'G@roles:mdw:tomcat*':
    - mdw.tomcat.install
    - mdw.tomcat.instance
  'G@roles:mdw:httpd':
    - mdw.httpd.install
  'G@roles:app':
    - app.install