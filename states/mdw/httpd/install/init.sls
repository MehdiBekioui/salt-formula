{% from 'mdw/common/install.sls' import installMdw %}
{% set name = 'httpd' %}
{% set mdwLink = pillar['fs'].installDir + '/' + name %}

{{ installMdw('httpds', name, 'httpd-') }}

chrpath -r "{{ mdwLink }}/lib" {{ mdwLink }}/bin/httpd:
  cmd.run

{{ mdwLink }}/conf/common.conf:
  file.recurse:
    - name: {{ mdwLink }}/conf
    - source: salt://mdw/httpd/install/files
    - template: jinja
    - context:
        installDir: {{ mdwLink }}