# steps to bring up the network
cd ~/fabric-dev-servers/

./fabricUtil.sh start

cd code/penguins/

composer network install --archiveFile collectable-penguin-network.bna  --card PeerAdmin@hlfv1

# after this step, a card will be generated in the same directory (admin@collectable-penguin-network.card)
composer network start --networkName collectable-penguin-network -V 0.1.7  -c PeerAdmin@hlfv1 -A admin -S adminpw

composer card import -f ./admin@collectable-penguin-network.card

export COMPOSER_PROVIDERS='{
  "github": {
    "provider": "github",
    "module": "passport-github",
    "clientID": "<642995796a6c4112a8f3>",
    "clientSecret": "<4b2427be229cdc3c0e013a648b6169a1001810dd>",
    "authPath": "/auth/github",
    "callbackURL": "/auth/github/callback",
    "successRedirect": "/",
    "failureRedirect": "/"
  }
}'


https://github.com/login/oauth/authorize?
response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fauth%2Fgithub%2Fcallback&client_id=%3C642995796a6c4112a8f3%3E




#!/bin/bash

# Setup the Environment variables for the REST Server

#1. Set up the card to be used
export COMPOSER_CARD=admin@collectable-penguin-network

#2. Set up the namespace usage    always |  never
export COMPOSER_NAMESPACES=never

#3. Set up the REST server Authhentcation    true | false
export COMPOSER_AUTHENTICATION=true

#4. Set up the Passport strategy provider
export COMPOSER_PROVIDERS='{
  "github": {
    "provider": "github",
    "module": "passport-github",
    "clientID": "642995796a6c4112a8f3",
    "clientSecret": "bd96da24fe2674f7bed23cebb55724cd0ff52b8d",
    "authPath": "/auth/github",
    "callbackURL": "/auth/github/callback",
    "successRedirect": "http://localhost:4300?loggedIn=true",
    "failureRedirect": "/"
  }
}'

#5. Execute the REST server
composer-rest-server -m true
