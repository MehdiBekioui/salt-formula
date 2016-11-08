tomcats:
  instances:
    usr-backend-01:
      mdw:
        jdkAlias: jdk8
        tomcatAlias: tomcat8
      lib:
        mysql-connector-java-6.0.5.jar: salt://deliveries/lib/mysql-connector-java-6.0.5.jar
      datasources:
        usr:
          jndi: jdbc/usr-db
          driver: com.mysql.cj.jdbc.Driver
          url: jdbc:mysql://localhost:3306/usr
          usr: usr
          pwd: solidsnail
          options:
            minIdle: 6
            maxIdle: 30
            maxActive: 100
            maxWait: 1000
      catalinaOpts:
        - -server
        - -Xms512m
        - -Xmx512m
        - -XX:MetaspaceSize=256m