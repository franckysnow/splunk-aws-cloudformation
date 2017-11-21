# splunk-aws-cloudformation

CloudFormation scripts to deploy and install Splunk Enterprise.

## Deploy to AWS with git post-commit hook
To deploy automatically to AWS, use git post-commit hook stored in git-hooks folder.

``` shell
ln -s git-hooks/post-commit .git/hooks/post-commit 
```

