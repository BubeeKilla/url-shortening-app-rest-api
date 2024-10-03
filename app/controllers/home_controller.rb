require 'aws-sdk-dynamodb'
require 'securerandom'

class HomeController < ApplicationController
  TABLE_NAME = 'url-shortener'  # Your existing DynamoDB table name

  def dynamodb
    @dynamodb ||= Aws::DynamoDB::Client.new(
      region: ENV['AWS_REGION'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    )
  end

  def index
  end

  def shorten
    long_url = params[:long_url]
    if long_url.present?
      short_code = SecureRandom.hex(4)

      # Save to DynamoDB
      dynamodb.put_item({
        table_name: TABLE_NAME,
        item: {
          'short_code' => short_code,
          'long_url' => long_url
        }
      })

      @short_code = short_code
    end
    render :shorten  # Render the shorten view
  end 

  def expand
    short_code = params[:short_code]
    if short_code.present?
      result = dynamodb.get_item({
        table_name: TABLE_NAME,
        key: { 'short_code' => short_code }
      })
      if result.item
        @long_url = result.item['long_url']
      else
        @error = 'No URL found for this code'
      end
    end
    render :index  # Render the index view after expanding
  end
end
