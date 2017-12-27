autossh
=======

Opens SSH connections from an OpenRC system.

Requirements
------------

User is authenticated thanks to a private key named as the `autossh_name` key.

Role Variables
--------------

- `autossh_name`: Key to identify connection.
- `autossh_host`: Hostname or IP address to connect to.
- `autossh_port`: TCP port to connect to.
- `autossh_login`: Username used to authenticate on remote server.
- `autossh_local_forwards`: Local port forwards to remote localhost. Written as `<local_port>:<remote_port>` and separated by spaces.

Dependencies
------------

None.

Example Playbook
----------------

    - hosts: proxy_servers
      roles:
        - role: stephdewit.autossh
          autossh_name: app_server_01
          autossh_host: app01.example.com
          autossh_port: 2222
          autossh_login: me
          autossh_local_forwards: 3000:3000 3010:3010 4000:4000

License
-------

BSD

Author Information
------------------

Stéphane de Wit (https://www.stephanedewit.be/)
