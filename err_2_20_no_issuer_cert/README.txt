Scripts in this folder simulate an error scenario when the trusted CA chain is not complete, raising error 2: unable to get issuer certificate. To get this error, I deleted the root CA certificate in the CA verification chain file, i.e. change line 89 in ./create_certs.sh from 

cat ${INTERMEDIATE_CA_DIR}/certs/intermediate_ca.cert.pem \
    ${ROOT_CA_DIR}/certs/root_ca.cert.pem > ${INTERMEDIATE_CA_DIR}/certs/ca-chain.cert.pem

to 

cat ${INTERMEDIATE_CA_DIR}/certs/intermediate_ca.cert.pem > \
    ${INTERMEDIATE_CA_DIR}/certs/ca-chain.cert.pem

In this scenario, both the client and server cannot trust each other.

Changing it to this will cause error 20: unable to get local issuer certificate:

cat ${ROOT_CA_DIR}/certs/root_ca.cert.pem > \
    ${INTERMEDIATE_CA_DIR}/certs/ca-chain.cert.pem