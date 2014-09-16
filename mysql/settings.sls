{% set p = salt['pillar.get']('mysql', {}) %}
{% set g = salt['grains.get']('mysql', {}) %}


{%- set default_root_password = 'bigdata' %}

{%- set root_password = g.get('root_password', p.get('root_password', default_root_password)) %}

{%- set mysql_settings = {} %}
{%- do mysql_settings.update({
                          'root_password' : root_password,
                       })%}

