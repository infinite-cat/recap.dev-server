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

### Slack

Slack integration sends various notification messages to a specified Slack channel

#### Setup

1. Go to [Slack Apps](https://api.slack.com/apps)

2. Create a new App 

![Creating a new Slack App](https://github.com/ArsenyYankovsky/recap.dev-server/raw/master/docs/assets/slack-create-app.png "Creating a new Slack App")

Give it a name, something like recap.dev will work. Choose your workspace where you want to get the messages as a development workspace.

3. Go to OAuth & Permissions and add two scopes to the Bot Token scopes section: `chat:write` and `chat:write.customize`

![Adding OAuth Scopes](https://github.com/ArsenyYankovsky/recap.dev-server/raw/master/docs/assets/slack-scopes.png "Adding OAuth Scopes")

4. Now it's time to install the bot to your workspace. In the same OAuth & Permissions section click Install App to Workspace

5. After you've successfully installed the bot to your workspace, you will get a bot token. Copy it.

![Copying slack bot token](https://github.com/ArsenyYankovsky/recap.dev-server/raw/master/docs/assets/slack-bot-token.png "Copying slack bot token")

6. Invite the bot to the channel by typing `/invite @recapdev` 

7. Go to your recap.dev server settings page, then to integrations tab. Find Slack settings there. Paste your bot token and write the name of the channel where you want your notifications to go.

![Setting up your recap.dev and Slack integration](https://github.com/ArsenyYankovsky/recap.dev-server/raw/master/docs/assets/recap-slack-settings.png "Setting up your recap.dev and Slack integration")

8. Click Test to make sure integration works. This should send a message to the channel that looks like this:

![Slack Test Message](https://github.com/ArsenyYankovsky/recap.dev-server/raw/master/docs/assets/slack-test-message.png "Slack Test Message")

9. Don't forget to click save.
