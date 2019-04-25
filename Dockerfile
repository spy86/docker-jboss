FROM jboss/base-jdk:8

LABEL version="1.0" maintainer="Maciej Michalski <maciej.michalsk@gmail.com>"

ENV WILDFLY_VERSION 16.0.0.Final
ENV JBOSS_HOME /opt/jboss/wildfly

USER root

RUN cd $HOME \
    && curl -O https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz \
    && tar xf wildfly-$WILDFLY_VERSION.tar.gz \
    && mv $HOME/wildfly-$WILDFLY_VERSION $JBOSS_HOME \
    && rm wildfly-$WILDFLY_VERSION.tar.gz \
    && chown -R jboss:0 ${JBOSS_HOME} \
    && chmod -R g+rw ${JBOSS_HOME}

ENV LAUNCH_JBOSS_IN_BACKGROUND true

USER jboss

EXPOSE 8080

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
