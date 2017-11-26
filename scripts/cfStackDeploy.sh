#! /bin/sh

bucketPath=splunk-deployment/templates

if [[ -z "${AWSBUCKET}" ]]; then
    echo "AWSBUCKET variable is unset. set using \"export AWSBUCKET=my-dns-compliant-bucket\""
    exit 1
fi

# get my public ip address
publicIpAddress=`curl -s https://api.ipify.org`

stackURL=https://s3-eu-west-1.amazonaws.com/$AWSBUCKET/$bucketPath/master.template.yml
echo $stackURL
aws cloudformation create-stack --stack-name Splunk-test \
    --template-url $stackURL \
    --parameters ParameterKey=SSHFrom,ParameterValue=$publicIpAddress/32 \
                 ParameterKey=BucketName,ParameterValue=franckysnow-utility \
                 ParameterKey=KeyNameBastion,ParameterValue=SplunkExternal \
                 ParameterKey=KeyNameSplunk,ParameterValue=SplunkInternal

