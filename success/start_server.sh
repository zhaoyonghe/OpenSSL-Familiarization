WORK_DIR=container
ROOT_CA_DIR=${WORK_DIR}/root_ca
INTERMEDIATE_CA_DIR=${WORK_DIR}/intermediate_ca
readonly WORK_DIR
readonly ROOT_CA_DIR
readonly INTERMEDIATE_CA_DIR

openssl s_server -accept 4399 -HTTP -verify 4 -verify_return_error \
    -pass pass:yyyy \
    -key ${INTERMEDIATE_CA_DIR}/private/www.test.com.key.pem \
    -cert ${INTERMEDIATE_CA_DIR}/certs/www.test.com.cert.pem \
    -CAfile ${INTERMEDIATE_CA_DIR}/certs/ca-chain.cert.pem
