FROM alpine

WORKDIR /

# Enable SSL
RUN apk --update add ca-certificates wget

# Install Helm
ENV VERSION v2.4.2
ENV FILENAME helm-${VERSION}-linux-amd64.tar.gz
RUN wget https://kubernetes-helm.storage.googleapis.com/${FILENAME} -O /tmp/helm.tar.gz
RUN tar -zxvf /tmp/helm.tar.gz -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm \
  && rm -rf /tmp

# Helm plugins require git
# helm-diff requires bash, curl
#RUN apk --update add git bash curl

# Install Helm plugins
RUN helm init --client-only