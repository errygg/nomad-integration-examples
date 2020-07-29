cd ../postgres
./start-postgres.sh
./configure-postgres.sh

cd ../vault
./start-vault.sh
sleep 5
./configure-vault.sh

cd ../nomad
./start-nomad.sh

cd ../app
mvn clean install spring-boot:repackage
sleep 5

cd target
python -m SimpleHTTPServer 8000 > /tmp/http.log 2>&1 &
sleep 5

cd ../../jobs
nomad job run app.hcl
