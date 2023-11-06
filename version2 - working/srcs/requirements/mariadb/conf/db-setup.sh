#!/bin/bash

# Start the MySQL service
service mysql start 

# Create the db1.sql file with commands 
# (we cannot read environment variables in the mysql command directly)
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

# Print the contents of the db1.sql for debugging
echo "Contents of db1.sql:"
cat db1.sql

# Sleep for a short while to allow a human to read the printed script
sleep 10

# Execute the SQL script
mysql < db1.sql

# Stop the MySQL service by killing the mysqld process
kill $(cat /var/run/mysqld/mysqld.pid)

# Start the mysqld process in the foreground (daemon) to keep the container running
mysqld
