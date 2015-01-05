#!/bin/sh

PASSWORD=${SINOPIA_PASSWORD:-$(wget -q -O - https://www.random.org/strings/\?num\=1\&len\=16\&digits\=on\&upperalpha\=on\&loweralpha\=on\&unique\=on\&format\=plain\&rnd\=new | tr -d '\n' | awk '{print $1}')}
PASSWORD_HASH=$(echo -n $PASSWORD | sha1sum | awk '{print $1}')
USER=${SINOPIA_USER:-$(echo -n 'admin')}

sed -e 's/\users\:/users\:\n  '${USER}'\:\n    password\: '${PASSWORD_HASH}'/' config.yaml > config.yaml

echo 'Your admin user was created, the credentials are:'
echo 'User:' $USER
echo 'Password:' $PASSWORD
