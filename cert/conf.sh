IP=$(ip addr show ens33 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

passphrase="toto"
config_file="conf.txt"

country=$(sed -n '1p' "$config_file")
state=$(sed -n '2p' "$config_file")
locality=$(sed -n '3p' "$config_file")
organization=$(sed -n '4p' "$config_file")
organizational_unit=$(sed -n '5p' "$config_file")
common_name=$(sed -n '6p' "$config_file")
email_address=$(sed -n '7p' "$config_file")



openssl genrsa -aes256 -passout pass:"$passphrase" -out ca-key.pem 4096
echo "$passphrase" | openssl req -new -x509 -sha256 -days 365 -passin stdin -key ca-key.pem -out ca.pem \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizational_unit/CN=$common_name/emailAddress=$email_address"
openssl genrsa -out cert-key.pem 4096
openssl req -new -sha256 -subj "/CN=notike-gestion.ltd" -key cert-key.pem -out cert.csr
echo "subjectAltName=DNS:notike-gestion.ltd,IP:$IP" >> extfile.cnf
openssl x509 -req -sha256 -passin pass:"$passphrase" -days 365 -in cert.csr -CA ca.pem -CAkey ca-key.pem -out cert.pem -extfile extfile.cnf -CAcreateserial
cat cert.pem > fullchain.pem; cat ca.pem >> fullchain.pem
