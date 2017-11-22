#! /bin/sh

home=..
path=splunk-deployment/templates

if [[ -z "${AWSBUCKET}" ]]; then
    echo "AWSBUCKET variable is unset. set using \"export AWSBUCKET=my-dns-compliant-bucket\""
    exit 1
fi

stackURL=https://s3-eu-west-1.amazonaws.com/$AWSBUCKET/$path/master.template.yml
echo $stackURL
aws cloudformation create-stack --stack-name Splunk-test --template-url $stackURL --parameters ParameterKey=SSHFrom,ParameterValue=77.30.42.142/32 ParameterKey=BucketName,ParameterValue=franckysnow-utility
