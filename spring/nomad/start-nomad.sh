VAULT_OUTPUT=/tmp/vault-output.txt
root=$(cat ${VAULT_OUTPUT?} | grep "Initial Root Token:" | sed -e "s/Initial Root Token: //g")
export VAULT_TOKEN=$root
nomad agent -config nomad.hcl > /tmp/nomad.log 2>&1 &
