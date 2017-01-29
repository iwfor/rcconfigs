#!/bin/bash

# Install DNScrypt-Proxy
sudo apt-get install -y dnscrypt-proxy
echo 'DNSCRYPT_PROXY_RESOLVER_NAME="d0wn-us-ns1"' | sudo tee -a /etc/default/dnscrypt-proxy
echo "d0wn-us-ns1,D0wn Resolver United States of America 01,Server provided by Martin 'd0wn' Albus,United States of America,,https://dns.d0wn.biz,1,yes,yes,yes,107.181.187.219,2.dnscrypt-cert.us.d0wn.biz,04BB:6100:7CFF:C72B:AF91:8942:F9DC:12A9:61A1:C6F2:177F:7CF9:F3C9:1B43:9FBE:6B80,pubkey.us.dnscrypt.d0wn.biz" | sudo tee -a /usr/share/dnscrypt-proxy/dnscrypt-resolvers.csv
