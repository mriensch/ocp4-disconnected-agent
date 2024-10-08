host_fqdn=$1
hostname=$2
cert_c="FB"   # Country Name (C, 2 letter code)
cert_s="."          # Certificate State (S)
cert_l="."       # Certificate Locality (L)
cert_o="foo"   # Certificate Organization (O)
cert_ou="bar"      # Certificate Organizational Unit (OU)
cert_cn="${host_fqdn}"    # Certificate Common Name (CN)

openssl req \
    -newkey rsa:4096 \
    -nodes \
    -sha256 \
    -keyout domain.key \
    -x509 \
    -days 365 \
    -out domain.crt \
    -addext "subjectAltName = DNS:${host_fqdn},DNS:${hostname},DNS:localhost" \
    -subj "/C=${cert_c}/ST=${cert_s}/L=${cert_l}/O=${cert_o}/OU=${cert_ou}/CN=${cert_cn}"
