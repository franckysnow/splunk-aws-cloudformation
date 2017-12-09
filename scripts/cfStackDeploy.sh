#! /bin/sh

bucketPath=splunk-deployment/templates

if [[ -z "${AWSBUCKET}" ]]; then
    echo "AWSBUCKET variable is unset. set using \"export AWSBUCKET=my-dns-compliant-bucket\""
    exit 1
fi

if [[ -z "${AWSCHEFPASS}" ]]; then
    echo "AWSCHEFPASS variable is unset. set using \"export AWSCHEFPASS=my-strong-password\""
    exit 1
fi

stackName="Splunk-test"
if [[ -n "$1" ]]; then
    stackName=$1
else
    echo "no stack name defined, deploying as Splunk-test"
fi


# get my public ip address
publicIpAddress=`curl -s https://api.ipify.org`

stackURL=https://s3-eu-west-1.amazonaws.com/$AWSBUCKET/$bucketPath/master.template.yml
echo $stackURL
aws cloudformation create-stack --stack-name $stackName \
    --template-url $stackURL \
    --capabilities CAPABILITY_IAM \
    --parameters ParameterKey=SSHFrom,ParameterValue=$publicIpAddress/32 \
                 ParameterKey=BucketName,ParameterValue=franckysnow-utility \
                 ParameterKey=KeyNameBastion,ParameterValue=SplunkExternal \
                 ParameterKey=KeyNameSplunk,ParameterValue=SplunkInternal \
                 ParameterKey=ChefPassword,ParameterValue=$AWSCHEFPASS

