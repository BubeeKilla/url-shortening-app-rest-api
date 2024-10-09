# README

URL shortener App is a Ruby on Rails application that allows users to shorten URl's, store them on AWS DynamoDB and acces them. The app provides a simple and intuitive interface for shortening URL's and retreiving all URL's content based on the random generated hex number.

## Features

- Shorten URL's
- Retrieve shorten URL's
- User-friendly interface

## Technologies Used

- Ruby on Rails
  - ruby -v
      ruby 3.3.5 (2024-09-03 revision ef084cc8f4) [x86_64-linux]
  - rails -v
      Rails 7.2.1
- AWS DynamoDB Table & Lambda.

## Installation

To run this project locally, follow these steps:

1. Clone the repository:
  
  git clone git@github.com:BubeeKilla/url-shortening-app.git

2. Change into the project directory:
  
  cd iurl-shortening-app

3. Install the required gems:

  bundle install

  if for some reason you get errors after trying to bundle install, use sudo bundle install, this will give you super user permissions to install all the needed gems and dependencies, and after use sudo chown -R $(whoami) $(gem env gemdir) to restore previous user permission settings. This step with previous user permissions is needed to prevent permission issues in the future by other users.

4. Create AWS DynamoDB Table and Lambda(give roles/permissions to work with DynamoDB):

  do not forget to make changes in the code regarding your DynamoDB and Lambda setup like table name etc.

5. Set up environment variables:

  Create a .env file in the root directory of your project and add your AWS credentials:

  AWS_ACCESS_KEY_ID=your_access_key_id
  AWS_SECRET_ACCESS_KEY=your_secret_access_key
  AWS_REGION=your_region

6. Start the server:

  rails server


## Usage

- Visit the homepage.
- Click on "Go to Shorten URL"
- Use the form to shorten your URL.
- Copy the displayed hex number.
- Go back to home page.
- Insert or paste the hex number.
- Click on the "Expand" to retreive URL.

## License

- This project is licensed under the MIT License - see the LICENSE file for details.
