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
