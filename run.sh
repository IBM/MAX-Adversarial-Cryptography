
if [ ! -f ./training-runs.yml ]; then
    cp ./training-runs.yml.template ./training-runs.yml

    sed -i .bak "s/    access_key_id:.*/    access_key_id: $AWS_ACCESS_KEY_ID/g" training-runs.yml
    sed -i .bak "s/    secret_access_key:.*/    secret_access_key: $AWS_SECRET_ACCESS_KEY/g" training-runs.yml

    aws --endpoint-url=http://s3-api.us-geo.objectstorage.softlayer.net s3 mb s3://adversarial-crypto-training
    aws --endpoint-url=http://s3-api.us-geo.objectstorage.softlayer.net s3 mb s3://adversarial-crypto-training-results
fi

bx ml train adverserial_crypto.zip training-runs.yml

