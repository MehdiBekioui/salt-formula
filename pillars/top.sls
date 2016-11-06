base:
  '*':
    - fileSystem
  'G@roles:jdk7':
    - mdw.install.jdk7
  'G@roles:jdk8':
    - mdw.install.jdk8
  'G@roles:tomcat7':
    - mdw.install.tomcat7
  'G@roles:tomcat8':
    - mdw.install.tomcat8
  'G@roles:tomcat*':
    - mdw.instance.tomcat