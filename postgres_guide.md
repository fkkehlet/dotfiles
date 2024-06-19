# Postgres guide

1. Run install script
2. sudo /usr/bin/postgresql-setup --initdb
3. sudo systemctl enable --now postgresql.service; sudo systemctl status postgresql.service
4. sudo -i; su - postgres; createuser --interactive frederik; \du; \q; exit; exit

sudo nvim /var/lib/pgsql/data/pg_hba.conf

If ident authentication error: sudo -u postgres psql -> SHOW hba_file;

Then change ipv4 auth, ident -> md5 OR trust
