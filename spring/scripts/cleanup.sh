# Stop all the processes
pkill vault nomad
pg_ctl -D /usr/local/var/postgres stop
lsof -i TCP:8000 | awk '/LISTEN/ {print $2}' | xargs kill -9
lsof -i TCP:8080 | awk '/LISTEN/ {print $2}' | xargs kill -9
sleep 5 # Wait for the sockets to close

# Remove the log files
rm -rf /tmp/vault-output.txt /tmp/vault.log /tmp/postgres.log /tmp/http.log /tmp/nomad.log

# Remove all the data dirs
rm -rf /tmp/vault /tmp/nomad /usr/local/var/postgres
