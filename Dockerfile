FROM erlio/docker-vernemq:1.1.0
RUN apt-get update && apt-get install -y \
    mosquitto-clients curl && \
    rm -rf /var/lib/apt/lists/*

ENV REDIS_AUTH_PLUGIN_VERSION 0.1.0
ENV DOCKER_VERNEMQ_PLUGINS__REDIS_AUTH_PLUGIN on
ENV DOCKER_VERNEMQ_PLUGINS__REDIS_AUTH_PLUGIN__PATH /etc/vernemq_redis_auth_plugin
ENV DOCKER_VERNEMQ_PLUGINS__VMQ_PASSWD off
ENV DOCKER_VERNEMQ_PLUGINS__VMQ_ACL off
ENV DOCKER_VERNEMQ_PLUGINS__VMQ_DIVERSITY off

RUN curl -Lo /tmp/redis_auth_plugin.tar.gz https://github.com/topfreegames/vernemq_redis_auth_plugin/releases/download/${REDIS_AUTH_PLUGIN_VERSION}/redis_auth_plugin.tar.gz && \
    mkdir /etc/vernemq_redis_auth_plugin && \
    tar -zxvf /tmp/redis_auth_plugin.tar.gz -C /etc/vernemq_redis_auth_plugin && \
    rm /tmp/redis_auth_plugin.tar.gz
