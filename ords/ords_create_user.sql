create user ords01 identified by oracle default tablespace users temporary tablespace temp;

grant create session to ords01;
grant create table to ords01;
grant unlimited tablespace to ords01;
