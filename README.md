# URL Shortening RRest Api App

URL Shortening Rest API App is a Ruby on Rails application that allows users to shorten URL's, store and acces them on AWS DynamoDB with the help of AWS Lambda and AWS API Gateway. The app provides a simple and intuitive interface for shortening URL's and retreiving all URL's content based on the random generated hex number.

## Table of Contents
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [License](#license)

## Technologies Used

- Ruby on Rails
- AWS DynamoDB.
- AWS Lambda
- AWS API Gateway

## Getting Started

### Installation
1. Clone the repository:
  ```bash
  git clone https://github.com/BubeeKilla/url-shortening-app-rest-api.git
  cd url-shortening-app-rest-api
  ```
2. Install dependencies:
  ```bash
  bundle install
  ```
3. Create AWS DynamoDB Table:

  - do not forget to make changes in the code regarding your AWS API Gateway.

4. Set up environment variables:
   
- Create a .env file in the root directory of your project and add your AWS credentials:
  ```.env
  AWS_ACCESS_KEY_ID=your_access_key_id
  AWS_SECRET_ACCESS_KEY=your_secret_access_key
  AWS_REGION=your_region
  ```
5. Start the server:
  ```bash
  rails server
  ```

### Usage

- Visit the homepage.
- Click on "Go to Shorten URL"
- Use the form to shorten your URL.
- Copy the displayed hex number.
- Go back to home page.
- Insert or paste the hex number.
- Click on the "Expand" to retreive URL.

## License

- This project is licensed under the MIT License - see the LICENSE file for details.
