# Mysql Database setup commands
    wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
    yum localinstall mysql57-community-release-el7-11.noarch.rpm -y
    yum install mysql-community-server -y
    systemctl start mysqld.service
  # Here we get pwd
    
    cat /var/log/mysqld.log
# Mysql Login

    mysql -u root -p
    ALTER USER 'root'@'localhost' IDENTIFIED BY 'Naresh#240';

# Update shell script and run
    sh mysql_backup.sh
