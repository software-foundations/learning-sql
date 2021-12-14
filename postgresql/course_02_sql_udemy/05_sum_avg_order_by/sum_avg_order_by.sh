# -> Login
sudo systemctl start postgresql@12-main.service
sudo -iu root
psql
\connect c2_data_science
\conninfo
\! clear