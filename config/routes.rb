Rails.application.routes.draw do
  root 'home#index' # This sets the root path to the index action
  get 'shorten', to: 'home#shorten'  # GET request to display the shorten form
  post 'shorten', to: 'home#shorten' # POST request to submit the shorten form
  get 'expand', to: 'home#expand'     # GET request for the expand action
end
