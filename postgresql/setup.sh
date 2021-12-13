# -> install postgresql
# https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart-pt

sudo apt update
sudo apt install postgresql postgresql-contrib

# -> Start
sudo systemctl start postgresql@12-main

# -> Stop
sudo systemctl stop postgresql@12-main

# -> restart
sudo systemctl restart postgresql@12-main

# -> enable
sudo systemctl enable postgresql.service

# -> status
sudo systemctl status postgresql.service

# -> enter postgresql user
sudo -i -u postgres

# -> enter postgresql console
psql

# -> exit postgresql console
\q

# -> enter console directly
sudo -u postgres psql

# -> list users (in console)
/du

# -> creating a new user
# select super user when using 'root' as username
createuser --interactive

# -> creating database

# way 01: in psql terminal
# createdb <psql_username>
createdb root

# way 02: in ubuntu terminal
sudo -u postgres createdb root

# -> in ubuntu shell
# the psql user name shold exist on ubuntu users
# then, when not, we must create
sudo adduser <user_name_other_than_root>

# -> conecting to the db
# way 01
# sudo -i -u <user_name>
sudo -i -u root
psql

# way 02
# sudo -u <user_name> psql
sudo -u root psql

# -> verifying connection
\conninfo

# -> connect to a specifc database
\connect <db_name>

# -> install pgadmin
# https://digitalinnovation.one/artigos/instale-o-postgresql-com-pgadmin4-no-ubuntu-2004
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main"> /etc/apt/sources.list.d/pgadmin4.list && apt update '

sudo apt update

sudo apt install pgadmin4

# -> creating dvdrental database
# https://www.postgresqltutorial.com/postgresql-restore-database/

# step 01
sudo -iu root
psql
CREATE DATABASE dvdrental;
\connect dvdrental
\conninfo
\q

# step 02
# way 01
# cd /etc/postgresql/12/main/ # does not work
cd /usr/lib/postgresql/12/bin/
pg_restore --dbname=dvdrental --verbose c:\pgbackup\dvdrental.tar

pg_restore --dbname=dvdrental --create --verbose c:\pgbackup\dvdrental.tar

# way 02 (preferred. USE THIS)
# https://www.postgresqltutorial.com/postgresql-backup-database/
cd /usr/lib/postgresql/12/bin/
pg_dump -U postgres -W -F t dvdrental > path/to/dvdrental.tar

# way 03
# https://www.geeksforgeeks.org/postgresql-loading-a-database/
cd /usr/lib/postgresql/12/bin/
pg_restore -U postgres -d dvdrental path/to/dvdrental.tar

# way 04
# youtube
# postgresql - how to backup and restore database
pg_dump --help
pg_dump -Fc -h 127.0.0.1 -p 5432 -U root dvrental -f dvdrental.dump
ls -la | grep rental

sudo su - postgres
createdb --help
createdb dvdrental -O root
logout

ph_restore --help
pg_restore -d dvdrental -h 127.0.0.1 -U root /path/to/dvdrental.dump

# way 05
# https://stackoverflow.com/questions/64633663/restoring-a-postgres-database-hangs-with-no-error
pg_restore --dbname=DatabaseName -Upostgres --format=tar example.tar
# step 03
psql

# step 04
# USE dvdrental; # does not work
\c dvdrental
