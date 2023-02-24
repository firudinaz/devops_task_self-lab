
### Tech Challange
##### The web project should include a simple API GET endpoint providing JSON data from the database.
# Project Description


#### The CI/CD presently has 5 phases:

1) A Docker image has been created and is attached to ECR. For that, we've secured and masked our AWS credentials as a Gitlab CI-CD variable.
2) Our Python Flask program launches in the build process, connecting to our RDS and bringing information regarding it in JSON format.
3) Then it is validated by Terraform and checked in our Terraform.
4) The Terraform plan will demonstrate what the system needs.
5) Terraform Apply begins, but the job stops, providing only the option to manually approve, deploy to production, and export the required data.
#### Structur created ClickOps, and we have init.sql in the Terraform share, which applies and is utilized to configure the server.

## 🛠 Tech Stack

**GitLab:**  - Open source self-hosted Git management software.

**Flask:**  - The Python micro framework for building web applications.

**Python:** - A programming language that lets you work quickly.

**Docker:** - A tool to create, deploy and run applications inside containers.

**Terraform:** - Cloud Infrastructure as Code

**AWS Elastic Container Registry (ECR)**  - An AWS service that helps to storing custom images

**Amazon RDS:** - Managed services that makes it simple to set up, operate, and scale databases in the cloud. 

**Amazon WAF:** - That helps lets you monitor web requests that are forwarded to Amazon CloudFront distributions or an Application Load Balancer. 

**SonarQube:** - Continuous inspection of code quality to perform automatic reviews with static analysis of code to detect bugs and code smells on 29 programming languages

## Features

- Connecting to our RDS and bringing information regarding it in JSON format 


## Environment Variables

To run this project, you will need to add the following environment variables to CI/CD 

`AWS_ACCESS_KEY_ID`

`AWS_DEFAULT_REGION`

`AWS_SECRET_ACCESS_KEY`

`DATABASE_PATH`

`MYSQLUSER`

`MYSQLPASS`

`DATABASE_PATH`

`SONAR_HOST_URL`

`SONAR_TOKEN`

## Gitlab Repository `41992770`
https://gitlab.com/fdavud-aws1/ut-tech-challange

## Demo

https://10biznes.com


## API Reference

#### Get all items

```
  GET https://10biznes.com
```

| Type     | Description                |
| :------- | :------------------------- |
| `string` |  Bringing information regarding it in JSON format |





## Running Manual for DB

We can import sql into database through our CI/CD, simply by editing `./db/init.sql`.

`init.sql` is the database file, which will create the libraries and tables needed by the flask application.

#### Example: 
```
  CREATE DATABASE knights;
use knights;

CREATE TABLE name_surname (
  name VARCHAR(20),
  color VARCHAR(10)
);

INSERT INTO favorite_colors
  (name, surname)
VALUES
  ('Firudin', 'Davudzada'),
  ('Davudzada', 'Firudin');


```

## List of Security Recommendations

**Requirement**
- Creating proper Security Requirements and Standards
- Applying WAF to the application

**Design**
- Performing Threat Modelling
- Continuous security requires more than just automated test-driven security tooling like vulnerability scanning, static code analysis and configuration checks in the CI/CD pipeline. Assessing risk is necessary to ensuring that the right security controls are built into an application from the start, and through every iteration of the development lifecycle. Threat modeling, at its essence, is a risk management exercise; one that can play a significant role in delivering products to customers faster and with greater quality and security than ever.

**Code/Build**
- Integrating Static Application Security Testing (SAST) to CI/CD - Sonarqube, Synk
- Integrating Software Composition Analysis (SCA) to CI/CD- SonaType Open Source Security & Dependency Management,Snyk
- Integrating Container Security Scanning to CI/CD- Falco , Wazuh, Aqua Security
- Integrating Secure Dependency Management to CI/CD- OSSIndex,OWASP Dependency-check

**Test**
- Integrating Dynamic Application Security Testing (DAST) to CI/CD -  OWASP Zap
- Performing Penetration Testing

**Release/Deploy**
- Secret Management & Infrastructure-as-Code (IaC) Secure Deployment - Security procedures are still required to protect the sensitive data, even when they could cause friction in an ongoing development process. Secrets management tools are also used to handle Helm charts, Kubernetes secrets, and many other types of secrets because CI/CD is frequently utilized in Infrastructure as Code (IaC) techniques.

## How would scale this project?

#### Approach: 

- We have gitlab. Everything was setup with manually. I’ve setup everything manually with terraform. While I set-up the Gitlab CI/CD , I already checked everything manually and pushed all sources to Gitlab CI/CD. 
- There is python script in `app` folder. 
- There  is `init.sql` inside of the `db` folder which connect database with mysql dump and deploying required information to database that helps python can read that information from database.
- We have terraform validate, it help us to validates the configuration files in a directory
- We have terraform plan, that preview the actions Terraform would take to modify your infrastructure, or save a speculative plan which you can apply later
- We have terraform apply , which executes the actions proposed in a terraform plan . It is used to deploy your infrastructure. Typically apply should be run after terraform init and terraform plan.
- I’ve maked apply job manually `continue manual job` in our Gitlab CI/CD/
- All credentials (Docker registry,AWS credentials and etc.) set with Gitlab CI as a `variables`. 
- At the end when Terraform apply job completed that gave us an output.Such as (user,rds host,ecr registry.)
- The web service resources are  protected by `AWS WAF`

## Authors

- [@firudinaz](https://github.com/firudinaz) - Firudin Davudzada

 
