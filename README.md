## Starting a recap.dev server

### Amazon EC2

The simplest way of starting the recap.dev server on AWS is to start an instance with our AMI.

1. Go to AWS console

2. Go to EC2

3. Click launch and search community AMIs for the latest recap.dev AMI

## How to integrate

### Serverless Framework

#### 1. Adding simple tracing

To use recap.dev with the Serverless Framework all you need to do is to add recap.dev 
serverless plugin and configure it.

1. Install recap.dev serverless plugin

`yarn add --dev @recap.dev/serverless-plugin`

or

`npm i --save-dev @recap.dev/serverless-plugin`

2. Install recap.dev client library

`yarn add @recap.dev/client`

or 

`npm i --save @recap.dev/client`

3. Add recap.dev plugin to your serverless.yml

Please note that recap.dev plugin should be a first plugin in the list.

```
plugins:
  - "@recap.dev/serverless-plugin"
```

4. Add `RECAP_DEV_SYNC_ENDPOINT` environment variable

It should point to your recap.dev server installation.

```
provider:
  environment:
    RECAP_DEV_SYNC_ENDPOINT: http://recap-dev.company.com:8080/traces
```

Done. After doing this and redeploying you should start getting tracing data with basic details.

#### 2. Adding detailed function tracing

To add a detailed per-function performance breakdown you need to add a babel plugin

1. Install babel plugin


`yarn add --dev @recap.dev/babel-plugin`

or

`npm i --save-dev @recap.dev/babel-plugin`

2. Add plugin to your .babelrc

```
  "plugins": ["@recap.dev/babel-plugin"]
```


## Integrations

### AWS

AWS integration allows pulling CloudWatch logs from your Lambdas.

#### Setup

1. Create and assign IAM role with the following policy to your instance or container:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "logs:Describe*",
                "logs:Get*",
                "logs:List*",
                "logs:StartQuery",
                "logs:StopQuery",
                "logs:TestMetricFilter",
                "logs:FilterLogEvents"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
```

2. Go to settings in your recap.dev server and enable the ingration.
