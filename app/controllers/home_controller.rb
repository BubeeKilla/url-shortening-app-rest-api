require 'httparty'

class HomeController < ApplicationController
  API_BASE_URL = 'https://reqphyujmc.execute-api.eu-central-1.amazonaws.com/prod'  # Replace with your actual API Gateway URL

  def index
    # This action can be left empty. The view will handle all logic.
  end

  def shorten
    long_url = params[:long_url]
    
    if long_url.present?
      # Send POST request to the Lambda function via API Gateway
      response = HTTParty.post("#{API_BASE_URL}/shorten", 
        headers: { 'Content-Type' => 'application/json' }, 
        body: { long_url: long_url }.to_json)

      if response.success?
        @short_code = response['short_code']  # Parse the short code from the Lambda response
      else
        @error = 'Error shortening the URL'
      end
    end

    render :shorten  # Render the shorten view
  end

  def expand
    short_code = params[:short_code]

    if short_code.present?
      # Send GET request to the Lambda function via API Gateway with the short code directly in the URL
      response = HTTParty.get("#{API_BASE_URL}/#{short_code}")

      if response.success?
        @long_url = response['long_url']  # Parse the long URL from the Lambda response
      else
        @error = 'No URL found for this short code'
      end
    else
      @error = 'Please provide a short code'
    end

    render :index  # Render the index view after expanding
  end



end
