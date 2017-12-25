autossh
=======

Opens SSH connections from an OpenRC system.

Requirements
------------

User is authenticated thanks to a private key named as the `server_name` key.

Role Variables
--------------

- __targets.<server_name>.host__: Hostname or IP address to connect to.
- __targets.<server_name>.port__: TCP port to connect to.
- __targets.<server_name>.login__: Username used to authenticate on remote server.
- __targets.<server_name>.local_forwards__: Local port forwards to remote localhost. Written as `<local_port>:<remote_port>` and separated by spaces.

Dependencies
------------

None.

Example Playbook
----------------

    - hosts: proxy_servers
      roles:
        - role: stephdewit.autossh
          targets:
            server_name:
              host: server_name.example.com
              port: 22
              login: me
              local_forwards: 3000:3000 3010:3010 4000:4000

License
-------

BSD

Author Information
------------------

Stéphane de Wit (https://www.stephanedewit.be/)
