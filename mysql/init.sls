{% from "mysql/map.jinja" import mysql with context %}
{%- from 'mysql/settings.sls' import mysql_settings with context %}

mysql-server:
  pkg:
    - installed
    - name: {{ mysql.server }}
  service:
    - running
    - name: {{ mysql.service }}


mysql-client:
  pkg:
    - installed
    - name: {{ mysql.python }}

root:
  mysql_user.present:
    - host: localhost
    - password: {{ mysql_settings.root_password }}
    - require:
      - service: mysql-server
      - pkg: mysql-client
