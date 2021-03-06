Scripts in different folder simulate different client-server interaction scenarios. To run a scenario, you can first get into the corresponding folder. You can check the readmes in these folders to get more information about the scenario.

You may need to add execution permission:
chmod +x ./create_certs.sh
chmod +x ./start_server.sh
chmod +x ./client/start_client.sh

To run the scenario, you first run ./create_certs.sh to create all needed certificates. I hardcode the password to the private key in the script and write all default values in the config files. Thus, you can simply press "enter" to use the default value when creating the CSRs and press "y" when signing the certificates. Every step in the certificates creating procedure is labeled by a name explaining what operations this step will do. And these names will be printed in yellow on the console so that you can easily know what the script is doing. 

After ./create_certs.sh ends, you can see a folder called "container" in the current directory, storing all keys, CSRs, certificates, and other log files just created. Certificates www.test.com.cert.pem, client.cert.pem, encryptor.cert.pem, signer.cert.pem in the folder ./container/intermediate_ca/certs generated by this script are correspond to 2a, 2b, 2c, 2d in the homework description.

Then you should open two consoles. In the first console, you start the server by running "./start_server.sh". In the other, you run "cd ./client" and then "./start_client.sh" to start the client. The client will fetch "a.txt" from the server. The behaviors of the client and server differ in different scenarios.