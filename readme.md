### UBUNTU SETUP
# Initialization:
* docker & docker compose
	* add user to group docker:
	* $ sudo usermod -aG docker $USER
* prepare folder for pgadmin. From project's root folder:
	* $ mkdir -p ./db_data/pgadmin
	* $ sudo chmod 0777 ./db_data/pgadmin
* prepare folders for wal archive and physical backup
	* $ mkdir ./db_archive
	* $ mkdir ./db_backup
	* $ sudo chown 70:root ./db_archive && sudo chown 70:root ./db_backup

* $ docker compose up

* find out ip address of db_instance container and pgadmin container ($ ip addr) 

* use internet browser to connect to pgadmin on port 5050:
	* for example: 
	* http://172.17.0.1:5050
   
* login to pgadmin using credentials:
	* user: otus@test.ru
	* pass: root
* register server:	
	* hostname: db_instance container ip address
	* port: 5432
	* username: admin
	* password: root


# Bacup&Restore:

## Backup using pg_dumpall:
$ docker exec db_instance pg_dumpall -l otus_store -U admin > ./sql_dump/dbdumpfile.sql

## Physical backup (can be used for replication):
$ docker exec -it db_instance /bin/bash -c 'pg_basebackup -U admin -D /db_backup'


## Restore from dbdumpfile.sql:
$ cat ./sql_dump/dbdumpfile.sql | docker exec -i db_instance psql -U admin otus_store

## Restore from physical (replication process):
* Stop postgresql:
	* $ docker compose down

* Delete db_data:
	* $ sudo rm -R ./db_data

* Create db_data:
	* $ mkdir ./db_data

* Copy physical backup files to db_data:
	* $ sudo cp -a ./db_backup/. ./db_data

* Create singal file for postgres to start recovery:
	* $ sudo touch ./db_data/recovery.signal

* Change db_data owner and permissions:
	* $ sudo chown -R 70:root ./db_data
	* $ sudo chmod -R 700 ./db_data

* Start potgres:
	* $ docker compose up





