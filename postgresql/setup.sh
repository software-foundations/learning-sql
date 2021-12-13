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