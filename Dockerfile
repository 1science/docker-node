#
# Node JS image
#

FROM 1science/alpine:3.4

# Node version
ENV NODE_VERSION=6.8.1

# Install Node
RUN apk update && apk-install make gcc g++ python linux-headers paxctl libgcc libstdc++ && \
  curl -sSL https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz | tar -xz && \
  cd /node-v${NODE_VERSION} && \
  ./configure --prefix=/usr && \
  make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  make install && \
  paxctl -cm /usr/bin/node && \
  apk del make gcc g++ python linux-headers paxctl && \
  find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf && \
  rm -rf /node-v${NODE_VERSION} \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html && \
  echo -ne "- with Node.js `node --version`\n" >> /root/.built
