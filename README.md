# Verifiable Credentials Issuance with Pre-Authorized Code

The Curity Identity Server is able to issue verifiable credentials using the pre-authorized code flow from the [OpenID for Verifiable Credentials Issuance](https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-11.html) specification. This repository contains configuration files that can simplify setting up the Curity Identity Server for this scenario.

The files in this repo can be used in a few ways:

1. You can merge the configuration from `idsvr/basic-vci-configuration.xml` with your configuration of the Curity Identity Server to get all the basic settings required by VCI. This will create a wallet client, a credential type, scope, token issuer, signing keys, etc. This can be used as a basis for following the pre-authorized code tutorial: https://curity.io/resources/learn/pre-authorized-code. Note that the configuration file uses default names for profiles, data sources, etc. so it works best when the Basic Configuration Wizard was used.
2. You can merge the configuration from `idsvr/full-vci-configuration.xml` with your configuration of the Curity Identity Server. This will add all the required elements to run the pre-authorized code flow and can be used to simply run the flow as described in the tutorial: https://curity.io/resources/learn/pre-authorized-code/#testing-the-flow
3. There is a `run.sh` script that will start a Docker container with the Curity Identity Server configured with the full configuration. You can use the command to quickly set up an instance of the Curity Identity Server that can be used to test the flow. Before running the command, copy a license file to a `license.json` file in the root of this repository.

## More Information

Please visit [curity.io](https://curity.io/) for more information about the Curity Identity Server.

