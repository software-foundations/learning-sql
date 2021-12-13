# -> install postgresql
# https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart-pt

sudo apt update
sudo apt install postgresql postgresql-contrib

# -> Start
sudo systemctl start postgresql@12-main

# -> Stop
sudo systemctl stop postgresql@12-main

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
