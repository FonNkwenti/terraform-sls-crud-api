# Serverless CRUD REST API with AWS Lambda, API Gateway, and DynamoDB

This project demonstrates the implementation of a serverless CRUD (Create, Read, Update, Delete) REST API using AWS Lambda, API Gateway, and DynamoDB. The infrastructure is provisioned and managed with Terraform, and the Lambda functions are written in Node.js 18.

## Table of Contents

- [Serverless CRUD REST API with AWS Lambda, API Gateway, and DynamoDB](#serverless-crud-rest-api-with-aws-lambda-api-gateway-and-dynamodb)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Project Structure](#project-structure)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Testing](#testing)

## Prerequisites

Before you begin, ensure you have the following tools and accounts set up:

- [Node.js](https://nodejs.org/) (version 18 or later)
- [AWS Account](https://aws.amazon.com/)
- [Terraform](https://www.terraform.io/) (version 0.12 or later)
- [AWS CLI](https://aws.amazon.com/cli/)

## Project Structure

The project is organized into the following directories:

- **`modules/`**: Contains Terraform modules for infrastructure provisioning.
  - **`dynamodb/`**: Terraform module for DynamoDB.
  - **`api_gateway/`**: Terraform module for API Gateway.
  - **`lambda/`**: Terraform module for Lambda functions.

- **`infra/`**: Contains the main Terraform configuration files.
  - **`main.tf`**: The main Terraform configuration file.
  - **`variables.tf`**: Variable definitions.
  - **`outputs.tf`**: Output definitions.

- **`src/`**: Contains the source code for Lambda functions.
  - **`functions/`**: Organized by CRUD operations (create, read, update, delete).

- **`tests/`**: Contains unit tests for Lambda functions.

## Installation

1. Clone the repository:

    ```bash
    git clone <repository-url>
    cd my-serverless-api
    ```

2. Install Node.js dependencies:

    ```bash
    cd src/functions/create
    npm install

    cd ../read
    npm install

    # Repeat for update and delete directories
    ```

3. Install Terraform dependencies:

    ```bash
    cd modules/dynamodb
    terraform init

    cd ../api_gateway
    terraform init

    cd ../lambda_functions
    terraform init
    ```

## Usage

1. Update the `variables.tf` files in the `modules/api_gateway`, `modules/lambda`, and `modules/dynamodb` directories with your specific configuration.

2. Deploy the infrastructure using Terraform:

    ```bash
    cd infra
    terraform apply
    ```

3. Update the Lambda function code in the `src/functions/` directory as needed.

4. Redeploy the Lambda functions:

    ```bash
    cd infra/lambda_functions
    terraform apply
    ```

## Testing

Run unit tests for Lambda functions:

```bash
cd tests
npm install
npm test
