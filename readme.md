### UBUNTU SETUP
# Initialization:
1. install docker & docker compose
   add user to group docker:
   $ sudo usermod -aG docker $USER
   prepare folder for pgadmin. From project's root folder:
   $ mkdir ./db_data/pgadmin
   $ sudo chmod 0777 ./db_data/pgadmin
   
2. run:
   $ docker compose up
3. find ip address of db_instance container ($ ip addr) 
4. find ip address of pgadmin container
5. use internet browser to connect to pgadmin on port 5050:
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
8. create empty db otus_store


# Bacup&Restore:

## Backup using pg_dumpall:
$ docker exec db_instance pg_dumpall -l otus_store -U admin > ./sql_dump/dbdumpfile.sql

## Restore from dbdumpfile.sql:
$ cat ./dbdumpfile.sql | docker exec -i db_instance psql -U admin otus_store
