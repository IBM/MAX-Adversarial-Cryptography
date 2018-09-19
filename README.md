# IBM Code Model Asset Exchange: Adversarial Cryptography Experiment

This repository contains code to run an Adversarial-Crypto experiment on [IBM Watson Machine Learning](https://www.ibm.com/cloud/machine-learning). This experiment performs adversarial training to learn trivial encryption functions. The model is based on the [TensorFlow implementation](https://github.com/tensorflow/models/tree/master/research/adversarial_crypto) and the 2016 paper ["Learning to Protect Communications with Adversarial Neural Cryptography"](https://arxiv.org/abs/1610.06918) by Abadi and Andersen.

This experiment creates and trains three neural networks, termed Alice, Bob, and Eve.  Alice takes inputs `in_m (message), in_k (key)` and outputs the ciphertext as a string. Bob takes inputs `in_k, ciphertext` and tries to reconstruct the message. Eve is an adversarial network that takes the ciphertext as its input and also tries to reconstruct the message. The main function attempts to train these networks and then evaluates them, all on random plaintext and key values.

This repository was developed as part of the [IBM Code Model Asset Exchange](https://developer.ibm.com/code/exchanges/models/)

## Model Metadata
| Domain | Application | Industry  | Framework | Training Data | Input Data Format |
| ------------- | --------  | -------- | --------- | --------- | -------------- |
| Security | Cryptography | General | TensorFlow | Randomly generated text | Text |

## References

* Abadi & Andersen, [Learning to Protect Communications with Adversarial Neural Cryptography](https://arxiv.org/abs/1610.06918), ,2016.
* [TensorFlow implementation](https://github.com/tensorflow/models/tree/master/research/adversarial_crypto)

## Licenses

| Component | License | Link  |
| ------------- | --------  | -------- |
| This repository | [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0) | [LICENSE](LICENSE) |
| Model Code (3rd party) | [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0) | [TensorFlow Models](https://github.com/tensorflow/models/blob/master/LICENSE)|

# Quickstart

## Prerequisites

* This experiment requires a provisioned instance of the IBM Watson Machine Learning service. If you don't have an instance yet, go to [Watson Machine Learning in the IBM Cloud Catalog](https://console.bluemix.net/catalog/services/machine-learning) to create one.

### Set Up an IBM Cloud Object Storage (COS) account
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

### Set Up IBM CLI & ML CLI

- Install [IBM Cloud CLI](https://console.bluemix.net/docs/cli/reference/ibmcloud/download_cli.html#install_use)
  - Log in using `bx login` or `bx login --sso` if within IBM
- Install [ML CLI Plugin](https://dataplatform.ibm.com/docs/content/analyze-data/ml_dlaas_environment.html)
  - After install, check if there is any plugins that need update
    - `bx plugin update`
  - Make sure to set up the various environment variables correctly:
    - `ML_INSTANCE`, `ML_USERNAME`, `ML_PASSWORD`, `ML_ENV`


## Running the experiment

The `train.sh` utility script will prompt the user to enter the names of the buckets to be created for the training data and result weights and start training the model as a `training-run` on the Watson ML service.

```
$ train.sh
Enter a training bucket name

$ adversarial-crypto-data
upload: ./NationalNames.csv to s3://name-gen-training/data/NationalNames.csv

Enter a results bucket name
$ adversarial-crypto-results
...
```

After training has started, it should print the training-id that is going to be necessary for steps below

```
Starting to train ...
OK
Model-ID is 'training-GCtN_YRig'
```

## Try this experiment in Fabric for Deep Learning

If you want to run this experiment using Fabric for Deep Learning ([FFDL](https://github.com/IBM/FfDL)), You can simply clone the FfDL repository and follow the instructions over [here](https://github.com/IBM/FfDL/blob/master/etc/converter/ffdl-wml.md) to convert your `training-runs.yml` into FfDL's specification.
