NODE_VERSION=0.12.7
curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
      && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
          && rm "node-v$NODE_VERSION-linux-x64.tar.gz"
