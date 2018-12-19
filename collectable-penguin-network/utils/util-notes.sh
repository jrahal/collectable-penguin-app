# steps to bring up the network
cd ~/fabric-dev-servers/

./fabricUtil.sh start

cd code/penguins/

composer network install --archiveFile stschain.bna  --card PeerAdmin@hlfv1

# after this step, a card will be generated in the same directory (admin@stschain.card)
composer network start --networkName stschain -V 0.1.7  -c PeerAdmin@hlfv1 -A admin -S adminpw

composer card import -f ./admin@stschain.card



# Run `composer-rest-server -c admin@stschain -m true` to start the multi-user rest server

# Run `composer-rest-server -c admin@stschain -p 3001` to start the rest server that will create identities


# Setup the Environment variables for the REST Server

#1. Set up the card to be used
export COMPOSER_CARD=admin@stschain

#2. Set up the namespace usage    always |  never
export COMPOSER_NAMESPACES=never

#3. Set up the REST server Authhentcation    true | false
export COMPOSER_AUTHENTICATION=true

#4. Set up the Passport strategy provider
export COMPOSER_PROVIDERS='{
  "github": {
    "provider": "github",
    "module": "passport-github",
    "clientID": " ",
    "clientSecret": " ",
    "authPath": "/auth/github",
    "callbackURL": "/auth/github/callback",
    "successRedirect": "/",
    "failureRedirect": "/"
  }
}'



# PLEASE CHANGE THIS TO point to your DB instance
# ================================================
# HOST = DB Server host,   PORT = Server port#
# database = Name of the database
# Credentials =>    user/password
# connector   =>    We are using mongodb, it can be
#                   any nosql database

export COMPOSER_DATASOURCES='{
    "db": {
        "name": "db",

        "host": "ds241875.mlab.com",
        "port": 41875,

        "database": "hlf-rest-api",

        "user": "test",
        "password": "test",

        "connector": "mongodb"
    }
}'

#5. Execute the REST server
composer-rest-server
