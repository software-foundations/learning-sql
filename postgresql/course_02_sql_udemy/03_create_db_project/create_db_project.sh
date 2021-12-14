# -> Login
sudo -iu root

# -> Drop database
dropdb "01_test" --username=root --host=127.0.0.1 --port=5432

# -> Create db project
createdb c2_data_science -O root

# ->
psql
\connect c2_data_science
\conninfo

# You are connected to database 
# "c2_data_science" as user "root" via socket 
# in " /var/run/postgresql" at port "5432".

# -> STOP when raise an error
# https://stackoverflow.com/questions/4480381/how-can-i-stop-a-postgres-script-when-it-encounters-an-error

# way 01
\set ON_ERROR_STOP on

# way 02
psql --single-transaction --file /your/script.sql

# way 03
-v ON_ERROR_STOP=1
psql --single-transaction --file /your/script.sql

# way 04
# It's not exactly what you want, but if you 
# start your script with begin transaction; and 
# end with end transaction;, it will actually 
# skip everything after the first error, and then 
# it will rollback everything it did before the 
# error.


# -> clear psql history
\! clear