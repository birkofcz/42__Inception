# FROM debian:buster

# RUN apt-get update && apt-get install -y mariadb-server gettext-base

# EXPOSE 3306

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY ./conf/init_db.sql /var/www/init_db.sql.template

# RUN service mysql start && mysql < /var/www/init_db.sql && rm -f /var/www/ini_db.sql;

# CMD ["mysqld"]

FROM debian:buster

# Install MariaDB and gettext-base
RUN apt-get update && apt-get install -y mariadb-server gettext-base

# Copy the configurations and script
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/db-setup.sh /usr/local/bin/db-setup.sh

# Make the script executable
RUN chmod +x /usr/local/bin/db-setup.sh

# Expose port 3306 for MariaDB
EXPOSE 3306

# Set the entrypoint to the database setup script
ENTRYPOINT ["db-setup.sh"]

# By default, start mysqld_safe (This will be run by the db-setup.sh script)
CMD ["mysqld_safe"]
