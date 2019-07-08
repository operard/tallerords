#!/bin/bash
 
java -jar ords.war set-property db.hostname $DB_HOSTNAME
java -jar ords.war set-property db.servicename $DB_SERVICE
# New variables
java -jar ords.war set-property user.public.password "$DB_PASSWORD"

java -jar ords.war standalone
