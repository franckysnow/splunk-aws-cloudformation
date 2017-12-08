# splunk-aws-cloudformation

CloudFormation scripts to deploy and install Splunk Enterprise.

## Deploy Splunk
To deploy the CloudFormation Stack, you must have AWS CLI installed on your machine.

``` shell
./scripts/cfStackDeploy.sh
```

## Upload tempaltes to AWS with git post-commit hook
To deploy automatically to AWS, use git post-commit hook stored in git-hooks folder.

``` shell
cd .git/hooks/
ln -s ../../git-hooks/post-commit post-commit
cd ../../
```
Define the bucket to upload the templates to.
``` shell
export AWSBUCKET=my-dns-compliant-bucket
```
