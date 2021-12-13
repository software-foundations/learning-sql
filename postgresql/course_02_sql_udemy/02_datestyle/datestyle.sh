# -> Login
sudo -iu root
psql
\connect 01_test
\conninfo
\d
\dt
\q

# -> Alter datestyle
cd "/etc/postgresql/12/main/"

nano postgresql.conf

# change from this
# datestyle = 'iso, dmy'

# to this
# datestyle = 'iso, mdy'

sudo systemctl stop postgresql@12-main.service
sudo systemctl start postgresql@12-main.service

# -> Login again
psql
\connect "01_test"