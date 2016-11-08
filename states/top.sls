base:
  'G@roles:mdw:jdk*':
    - mdw.install.jdk
  'G@roles:mdw:tomcat*':
    - mdw.install.tomcat
    - mdw.instance.tomcat
  'G@roles:app':
    - app.install