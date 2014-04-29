DeviseExample::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'registrations' => 'registrations#create', :as => 'register'
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
         
      end
      get 'user_providers' => 'user_providers#index'#returns all user providers
      post 'user_providers' => 'user_providers#create'#not used
      delete 'user_providers' => 'user_providers#destroy'#delete a provider
      
      get 'create_providers' => 'create_providers#index'#returns all providers
      post 'create_providers' => 'create_providers#create'#create a provider
      
      post 'subscribe_to' => 'subscribe_to#create'#subscribe to a provider
      
      post 'content_area' => 'content_area#create'#create a content/knowledge area
      get 'content_area' => 'content_area#index'#return all content/knowledge areas
      delete 'content_area' => 'content_area#destroy'#delete content area if no providers linked
      put 'content_area' => 'content_area#update'#Update content area hidden value
      
      post 'delivery_mode' => 'delivery_mode#create'#create a delivery mode
      get 'delivery_mode' => 'delivery_mode#index'#return all delivery moodes
      delete 'delivery_mode' => 'delivery_mode#destroy'#delete delivery mode if no providers linked
      put 'delivery_mode' => 'delivery_mode#update'#Update delivery mode hidden value

      
      post 'content_element' => 'content_element#create'#Create a content element
      get 'content_element' => 'content_element#index'#return all content element
      delete 'content_element' => 'content_element#destroy'#Delete a content element
      put 'content_element' => 'content_element#update'#Update content element hidden value
      
      post 'get_provider_content_elements' => 'get_provider_content_elements#create'#returns specfic providers content elements
      
      post 'get_provider_subscription_types' => 'get_provider_subscription_types#create'#returns specfic providers subscriptions types
      
      post 'format' => 'format#create'#create a format
      get 'format' => 'format#index'#return all the formats
      delete 'format' => 'format#destroy'#Delete a Format
      put 'format' => 'format#update'#Update Format hidden value
      
      post 'subscription_type' => 'subscription_type#create'#create a subscription type
      put 'subscription_type' => 'subscription_type#update'#Update subscription type hidden value
    end
  end

  devise_for :users, :admins

  get '/token' => 'home#token', as: :token

  resources :home, only: :index
  resources :admins, only: :index

  root 'home#index'

end
