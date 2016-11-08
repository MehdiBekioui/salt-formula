{% macro installMdw(listName, name, dirNamePrefix) %}
  {% set fs = pillar['fs'] %}

include:
  - fs.create.install

  {% for name, conf in salt['pillar.get'](listName + ':installs', {}).items() %}
    {% set mdwDir = fs.installDir + '/' + name + conf.version %}

    {% if not salt['file.directory_exists'](mdwDir) %}
      {% set mdwLink = fs.installDir + '/' + name %}

{{ mdwLink }}.extract:
  archive.extracted:
    - name: {{ fs.installDir }}
    - if_missing: {{ mdwDir }}
    - source: {{ conf.source.url }}
    {% if 'md5' in conf.source %}
    - source_hash: md5={{ conf.source.md5 }}
    {% endif %}
    {% if 'sha256' in conf.source %}
    - source_hash: sha256={{ conf.source.sha256 }}
    {% endif %}
    - archive_format: tar
    - tar_options: xf

{{ mdwLink }}.symlink:
  file.symlink:
    - name: {{ mdwLink }}
    - target: {{ fs.installDir }}/{{ dirNamePrefix }}{{ conf.version }}
    - require:
      - archive: {{ mdwLink }}.extract

    {% endif %}
  {% endfor %}
{% endmacro %}