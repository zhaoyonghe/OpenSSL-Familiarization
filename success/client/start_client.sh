WORK_DIR=../container
ROOT_CA_DIR=${WORK_DIR}/root_ca
INTERMEDIATE_CA_DIR=${WORK_DIR}/intermediate_ca
readonly WORK_DIR
readonly ROOT_CA_DIR
readonly INTERMEDIATE_CA_DIR

echo -e "GET /a.txt HTTP/1.1\r\nHost: test.com\r\nConnection: close\r\n\r\n" | \
openssl s_client -connect 127.0.0.1:4399 -ign_eof -verify 4 -verify_return_error \
    -pass pass:yyyy \
    -key ${INTERMEDIATE_CA_DIR}/private/client.key.pem \
    -cert ${INTERMEDIATE_CA_DIR}/certs/client.cert.pem \
    -CAfile ${INTERMEDIATE_CA_DIR}/certs/ca-chain.cert.pem