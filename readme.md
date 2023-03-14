### UBUNTU SETUP
# Initialization:
1. install docker & docker compose
   add user to group docker:
   $ sudo usermod -aG docker $USER
--   prepare folder for pgadmin. From project's root folder:
--  $ mkdir -p ./db_data/pgadmin
--  $ sudo chmod 0777 ./db_data/pgadmin

2. $ docker compose up

3. find ip address of db_instance container and pgadmin container ($ ip addr) 

4. use internet browser to connect to pgadmin on port 5050:
   for example: 
   http://172.17.0.1:5050
   
6. login to pgadmin using credentials:
	user: otus@test.ru
	pass: root
7. register server:	
	hostname: db_instance container ip address
	port: 5432
	username: admin
	password: root


# Bacup&Restore:

## Backup using pg_dumpall:
$ docker exec db_instance pg_dumpall -l otus_store -U admin > ./sql_dump/dbdumpfile.sql

## Physical backup (can be used for replication):
$ docker exec -it db_instance /bin/bash -c 'pg_basebackup -U admin -D /db_backup'


## Restore from dbdumpfile.sql:
$ cat ./sql_dump/dbdumpfile.sql | docker exec -i db_instance psql -U admin otus_store

## Restore from physical (replication process):
1. Stop postgresql:
$ docker compose down

2. Delete db_data:
$ sudo rm -R ./db_data

3. Create db_data:
$ mkdir ./db_data

4. Copy physical backup files to db_data:
$ sudo cp -a ./db_backup/. ./db_data

5. Create singal file for postgres to start recovery:
$ sudo touch ./db_data/recovery.signal

6. Change db_data owner and permissions:
$ sudo chown -R 70:root ./db_data
$ sudo chmod -R 700 ./db_data

7. Start potgres:
$ docker compose up





