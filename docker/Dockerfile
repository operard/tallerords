# Dockerfile for Oracle ORDS
# Updated to use openjdk:8-slim and reduce overall size

FROM openjdk:8-slim
# Dockerfile for Oracle ORDS

RUN apt-get update \
&& apt-get install -y curl \
&& apt-get install -y unzip \
&& mkdir app 

COPY ords-telefonica.zip app/ords-telefonica.zip
COPY entrypoint.sh app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

WORKDIR /app
RUN unzip ords-telefonica.zip

ENV PATH "$PATH:/app/"

WORKDIR /app/

ENTRYPOINT ["/app/entrypoint.sh"]
