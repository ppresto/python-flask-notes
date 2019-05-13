#!/bin/bash
set -e

#
### GLOBAL ENV VARIABLES
#
    FILE='.env'

    if [[ -f $FILE ]]; then
      rm $FILE
    fi

    if [[ -z $VAULT_ADDR ]]; then
      export VAULT_ADDR=http://vault:8200
    fi

    if [[ -z $DB_HOST ]]; then
      # Docker default for calling host machine
      DB_HOST='host.docker.internal'
    fi

#
### CREATE .env FILE.  FLASK APP WILL LOAD THESE ENV VARIABLES AT START TIME
#
    # DB_HOST=localhost
    # DB_NAME=notes
    # DB_USERNAME=demo
    # DB_PASSWORD=demopassword
    # DB_PORT=80
    # FLASK_ENV=development
    # FLASK_APP=.

    echo export DB_HOST=${DB_HOST} >> ${FILE}
    echo export DB_NAME='notes' >> ${FILE}

    #
    ### IF VAULT DOESN"T EXIST USE DEFAULT CREDENTIALS
    #

    if [[ ! -z $VAULT_TOKEN  ]]; then
      # wake up container
      ping=$(curl -H "X-Vault-Token: $VAULT_TOKEN" -X GET ${VAULT_ADDR}/v1/database/creds/notes-role)
      sleep 1

    #
    ### IF VAULT EXISTS CALL VAULT API FOR DYNAMIC CREDENTIALS
    #

      user=$(curl -H "X-Vault-Token: $VAULT_TOKEN" -X GET ${VAULT_ADDR}/v1/database/creds/notes-role)
      if [[ ! $(echo $user | grep "errors") ]]; then
        echo export DB_USERNAME=$(echo $user | jq -r .data.username) >> ${FILE}
        echo export DB_PASSWORD=$(echo $user | jq -r .data.password) >> ${FILE}
      fi
      echo -e "VAULT API URL:\t\t curl -H "X-Vault-Token: $VAULT_TOKEN" -X GET ${VAULT_ADDR}/v1/database/creds/notes-role"
      echo -e "VAULT API Response:\t${user}\n"

    else
      echo export DB_USERNAME='demo' >> ${FILE}
      echo export DB_PASSWORD='demopassword' >> ${FILE}
    fi

    echo export DB_PORT='80' >> ${FILE}
    echo export FLASK_ENV='development' >> ${FILE}
    echo export FLASK_APP='.' >> ${FILE}

#
### OUTPUT ENV INFO TO STDOUT and START FLASK APP
#
    cat ${FILE}

    if [ "$1" ]; then
        # execute it
        exec "$@"
    else
      # else flask app
      flask run --host=0.0.0.0 --port=3000

    fi
