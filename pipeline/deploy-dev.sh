set -e

echo "Installing Salesforce Cli"
npm install @salesforce/cli --global

echo "Checking if CLI installed"
sf version

echo "Decoding JWT Key"
echo "$SF_JWT_KEY" > server.key


echo "Authorizing org"
sf org login jwt --client-id $SF_CONSUMER_KEY --jwt-key-file server.key --username $SF_USERNAME --instance-url $SF_INSTANCE_URL

echo "Deploying Metadata"
sf project deploy start --manifest=manifest/package.xml --target-org $SF_USERNAME
