{% macro installMdw(listName, name, dirNamePrefix) %}
{% set fs = pillar['fs'] %}
{% set mdws = salt['pillar.get'](listName + ':installs', {}).items() %}

include:
  - fs.create.install

{% for mdw, args in mdws %}
  {% set path = fs.installDir + '/' + name + args['version'] %}
  {% if not salt['file.directory_exists'](path) %}
    {% set id = fs.installDir + '/' + mdw %}

{{ id }}.archive:
  archive.extracted:
    - name: {{ fs.installDir }}
    - if_missing: {{ path }}
    - source: {{ args['source'].url }}
    {% if 'md5' in args['source'] %}
    - source_hash: md5={{ args['source'].md5 }}
    {% endif %}
    {% if 'sha256' in args['source'] %}
    - source_hash: sha256={{ args['source'].sha256 }}
    {% endif %}
    - archive_format: tar
    - tar_options: xf

{{ id }}.symlink:
  file.symlink:
    - name: {{ fs.installDir }}/{{ mdw }}
    - target: {{ fs.installDir }}/{{ dirNamePrefix }}{{ args['version'] }}
  {% endif %}
{% endfor %}
{% endmacro %}