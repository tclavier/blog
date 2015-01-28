Title:Ssh
Date:2011-06-09
Tags:  mediawiki

Quelques astuces ssh

Une prison sftp
---------------

/etc/ssh/sshd\_config

    Subsystem       sftp    internal-sftp
     
    Match Group ftpusers
             ChrootDirectory /home/%u
             ForceCommand internal-sftp
             AllowTCPForwarding no
             X11Forwarding no

ajouter un user

`adduser foo`\
`adduser foo ftpusers`\
`chown root:root ~foo`\
`mkdir ~foo/ftp`\
`chown foo:foo ~foo/ftp`

