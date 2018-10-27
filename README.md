autossh
=======

Opens SSH connections from an OpenRC system.

Requirements
------------

None.

Role Variables
--------------

- `autossh_name`: Key to identify connection.
- `autossh_host`: Hostname or IP address to connect to.
- `autossh_port`: TCP port to connect to. Default: `22`.
- `autossh_login`: Username used to authenticate on remote server.
- `autossh_hostkey`: Host key of the remote server.
- `autossh_hash_host`: Host key of the remote server. Default: `no`.
- `autossh_options`: Parameters added to the SSH command line, e.g. for port forwarding.

An `autossh_public_keys` fact is set and contains a dictionary, indexed by the `autossh_name` value, with every public key.

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
          autossh_hostkey: [app01.example.com]:2222,[1.2.3.4]:2222 ssh-rsa AAAA1234.....=
          autossh_options: -L 3000:localhost:3000 -L 3010:localhost:3010

License
-------

BSD

Author Information
------------------

Stéphane de Wit (https://www.stephanedewit.be/)
