#
# Node JS image with Consul Template and Fileconsul
#
FROM 1science/node:6.8

# Consul template for configuration management
ENV S6_OVERLAY_VERSION=1.18.1.5 CONSUL_TEMPLATE_VERSION=0.16.0

# Install S6 Overlay, Consul Template and Fileconsul
RUN curl -Ls https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar -xz -C / && \
    curl -Ls https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip -o consul-template.zip && unzip consul-template.zip -d /usr/local/bin && \
    rm -f consul-template* && \
    echo -ne "- with `consul-template -v 2>&1`\n" >> /root/.built

# Add services configuration
ADD etc /etc

ENTRYPOINT ["/init"]
