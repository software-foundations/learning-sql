# https://www.postgresqltutorial.com/load-postgresql-sample-database/

# https://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge

# -> editing pg_hba.conf (peer -> trust)
cd etc/postgresql/12/main/
nano pg_hba.conf
	
	# -> change/alter form this
	# local   all             postgres                                peer

	# -> to this
	local   all             postgres                                trust

# -> restart psql from ubuntu terminal
sudo systemctl restart postgresql@12-main

# -> alter passwors
psql -U postgres
ALTER USER postgres with password '1234';
ALTER USER root with password 'root';
exit

# -> now, editing pg_hba.conf again (trust -> md5)
cd etc/postgresql/12/main/
nano pg_hba.conf
	
	# -> change/alter form this
	# local   all             postgres                                trust

	# -> to this
	local   all             postgres                                md5

# -> restart psql
# way 01 (from ubuntu terminal)
sudo systemctl restart postgresql@12-main
# way 02 (from psql terminal)
sudo service postgresql restart

# -> login at psql with psql user
psql -U postgres

# Side note: Same now works for my_user if you added the user and password:

#  psql -d YOUR_DB_NAME -U my_user
# Which will ask you for the new password of my_user.



CREATE DATABASE dvdrental;

# cd /etc/postgresql/12/main

pg_restore -U postgres -d dvdrental path/to/dvdrental.tar