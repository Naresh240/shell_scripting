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
# If you want to confirm follow below steps
  1. Create one more server and install mysql server
  2. Setup connection between two servers
  3. Copy back up file to 2nd server
  4. Extract backup file using below command
    
    gzip -d mysql-21Feb2021.sql.gz
  5. Restory data in second server using below command
    
    mysql -u root -p mysql < mysql-21Feb2021.sql
