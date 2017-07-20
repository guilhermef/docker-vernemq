FROM erlio/docker-vernemq:1.1.0
RUN apt-get update && apt-get install -y \
    mosquitto-clients \
&& rm -rf /var/lib/apt/lists/*
