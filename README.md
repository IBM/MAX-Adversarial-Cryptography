# IBM Code Model Asset Exchange: </br> Adversarial-Crypto experiment

This repository contains code to run the Adversarial-Crypto experiment on the [IBM Watson Machine Learning](https://www.ibm.com/cloud/machine-learning), from the IBM Code Model Asset Exchange.

>Adversarial training to learn trivial encryption functions, from the paper "Learning to Protect Communications with Adversarial Neural Cryptography", Abadi & Andersen, 2016.

>This experiment creates and trains three neural networks, termed Alice, Bob, and Eve.  Alice takes inputs in_m (message), in_k (key) and outputs 'ciphertext'. Bob takes inputs in_k, ciphertext and tries to reconstruct the message. Eve is an adversarial network that takes input ciphertext
and also tries to reconstruct the message. The main function attempts to train these networks and then evaluates them, all on random plaintext and key values.

# Quickstart

## Prerequisites

* This experiment requires a provisioned instance of IBM Watson Machine Learning service.

### Setup an IBM Cloud Object Storage (COS) account
- Create an IBM Cloud Object Storage account if you don't have one (https://www.ibm.com/cloud/storage)
- Create credentials for either reading and writing or just reading
	- From the bluemix console page (https://console.bluemix.net/dashboard/apps/), choose Cloud Object Storage
	- On the left side, click the service credentials
	- Click on the `new credentials` button to create new credentials
	- In the 'Add New Credentials' popup, use this parameter `{"HMAC":true} in the `Add Inline Configuration...`
	- When you create the credentials, copy the `access_key_id` and `secret_access_key` values.
	- Make a note of the endpoint url
		- On the left side of the window, click on `Endpoint`
		- Copy the relevant public or private endpoint. [I choose the us-geo private endpoint].
- In addition setup your [AWS S3 command line](https://aws.amazon.com/cli/) which can be used to create buckets and/or add files to COS.
   - Export AWS_ACCESS_KEY_ID with your COS `access_key_id` and AWS_SECRET_ACCESS_KEY with your COS `secret_access_key`

### Setup IBM CLI & ML CLI

- Install [IBM Cloud CLI](https://console.bluemix.net/docs/cli/reference/bluemix_cli/get_started.html#getting-started)
  - Login using `bx login` or `bx login --sso` if within IBM
- Install [ML CLI Plugin](https://dataplatform.ibm.com/docs/content/analyze-data/ml_dlaas_environment.html)
  - After install, check if there is any plugins that need update
    - `bx plugin update`
  - Make sure to setup the various environment variables correctly:
    - `ML_INSTANCE`, `ML_USERNAME`, `ML_PASSWORD`, `ML_ENV`


## Running the experiment

The run.sh utility script will deploy the experiment to WML and execute the experiment as a `training-run`

```
run.sh
```

## Licenses

| Component | License | Link  |
| ------------- | --------  | -------- |
| This repository | [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0) | [LICENSE](LICENSE) |
| Model Code (3rd party) | [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0) | [TensorFlow Models](https://github.com/tensorflow/models/blob/master/LICENSE)|


## References

* Abadi & Andersen, [Learning to Protect Communications with Adversarial Neural Cryptography](https://arxiv.org/abs/1610.06918), ,2016.
