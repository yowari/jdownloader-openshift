FROM centos

LABEL maintainer="yowari"

ARG JDOWNLOADER_URL=http://installer.jdownloader.org/JDownloader.jar

RUN yum -y install wget java-1.8.0-openjdk-headless && \
    mkdir -p /opt/JDownloader/ && \
    wget ${JDOWNLOADER_URL} -O /opt/JDownloader/JDownloader.jar && \
    chmod +x /opt/JDownloader/JDownloader.jar && \
    java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar && \
    chmod 777 /opt/JDownloader/ -R

COPY docker-entrypoint.sh /opt/JDownloader/
RUN chmod +x /opt/JDownloader/docker-entrypoint.sh

USER 1001

WORKDIR /opt/JDownloader/

EXPOSE 8080

ENTRYPOINT ["/opt/JDownloader/docker-entrypoint.sh"]
CMD ["java", "-Djava.awt.headless=true", "-jar", "/opt/JDownloader/JDownloader.jar"]