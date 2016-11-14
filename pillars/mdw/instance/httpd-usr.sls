httpds:
  instances:
    usr:
      listenPort: 80
      serverName: minion1
      extra:
        usr-backend.conf: |
          <VirtualHost *:80>
            ServerName minion1

            ProxyPass /usr http://localhost:8080/usr
            ProxyPassReverse /usr http://localhost:8080/usr
          </VirtualHost>