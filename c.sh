WORK_DIR=container
ROOT_CA_DIR=${WORK_DIR}/root_ca
INTERMEDIATE_CA_DIR=${WORK_DIR}/intermediate_ca
readonly WORK_DIR
readonly ROOT_CA_DIR
readonly INTERMEDIATE_CA_DIR

echo -e "GET /file_from_server.txt HTTP/1.0\r\n" | \
openssl s_client -connect localhost:4399 \
    -showcerts \
    -key ${INTERMEDIATE_CA_DIR}/private/client.key.pem \
    -cert ${INTERMEDIATE_CA_DIR}/certs/client.cert.pem