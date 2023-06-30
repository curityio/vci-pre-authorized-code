# Verifiable Credentials Issuance with Pre-Authorized Code

[![Quality](https://img.shields.io/badge/quality-demo-red)](https://curity.io/resources/code-examples/status/)
[![Availability](https://img.shields.io/badge/availability-source-blue)](https://curity.io/resources/code-examples/status/)

The Curity Identity Server can issue verifiable credentials using the pre-authorized code flow from the [OpenID for Verifiable Credentials Issuance](https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-11.html) specification. This repository contains configuration files that can simplify setting up the Curity Identity Server for this scenario.

## Configure Verifiable Credential Issuance

You can merge the configuration from `idsvr/basic-vci-configuration.xml` with your configuration of the Curity Identity Server to get all the basic settings required by VCI. This will create a wallet client, a credential type, scope, token issuer, signing keys, etc. This can be used as a basis for following the pre-authorized code tutorial: https://curity.io/resources/learn/pre-authorized-code. Note that the configuration file uses default names for profiles, data sources, etc. so it works best when the Basic Configuration Wizard was used.

This configuration adds:

* a new signing key `credential_issuer_key` with an external key ID (DID) to sign credentials with,
* a custom token issuer `credential_issuer` that can issue credentials as JWTs,
* a credential issuing endpoint at `/credential`,
* a scope called `openid_credential` for authorizing a client to request credentials in general,
* a verifiable credential called `UniversityDegree` with the user's `address`, `given_name` and `family_name`,
* a scope called `university_degree` for authorizing a client to request the claims in the university degree, 
* an OAuth client called `wallet` that is allowed to request the credential using [OAuth.tools](https://oauth.tools).

## Configure the Pre-Authorized Code Flow

You can merge the configuration from `idsvr/full-vci-configuration.xml` with your configuration of the Curity Identity Server. This will add all the required elements to run the pre-authorized code flow and can be used to simply run the flow as described in the tutorial: https://curity.io/resources/learn/pre-authorized-code/#testing-the-flow

In addition to the above, this configuration adds:

* a Token Procedure called `pre-authorized-code` that issues a `pre-authorized_code` and `user_pin`,
* the token procedure to the token-exchange flow at the token endpoint,
* an OAuth client called `university-website` that may request a pre-authorization code from the Curity Identity Server via [OAuth.tools](https://oauth.tools).

## Run the Curity Identity Server in Docker

There is a `run.sh` script that starts a Docker container with the Curity Identity Server that is configured for the pre-authorized code flow. You can use the command to quickly set up an instance of the Curity Identity Server that can be used to test the flow. Before running the command, copy a license file for the Curity Identity Server to a `license.json` file in the root of this repository. You can obtain a free license from [Curity's developer portal](https://developer.curity.io/). 

## More Information

Please visit [curity.io](https://curity.io/) for more information about the Curity Identity Server.

