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
  'G@roles:mdw:tomcat*':
    - mdw.instance.tomcat
  'G@roles:app':
    - app.versions
    - app.delivery