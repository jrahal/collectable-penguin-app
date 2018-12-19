#!/bin/bash

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
    "clientID": "642995796a6c4112a8f3",
    "clientSecret": "bd96da24fe2674f7bed23cebb55724cd0ff52b8d",
    "authPath": "/auth/github",
    "callbackURL": "/auth/github/callback",
    "successRedirect": "http://localhost:4300?loggedIn=true",
    "failureRedirect": "/"
  }
}'

#5. Execute the REST server
composer-rest-server
