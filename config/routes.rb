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
      get 'create_providers' => 'create_providers#index'#returns all providers
      post 'create_providers' => 'create_providers#create'#create a provider
      post 'subscribe_to' => 'subscribe_to#create'#subscribe to a provider
      post 'content_area' => 'content_area#create'#create a content/knowledge area
      get 'content_area' => 'content_area#index'#return all content/knowledge areas
      post 'delivery_mode' => 'delivery_mode#create'#create a delivery mode
      get 'delivery_mode' => 'delivery_mode#index'#return all delivery moodes
      post 'content_element' => 'content_element#create'#Create a content element
      post 'get_provider_content_elements' => 'get_provider_content_elements#create'#returns specfic providers content elements
      post 'format' => 'format#create'#create a format
      get 'format' => 'format#index'#return all the formats
    end
  end

  devise_for :users, :admins

  get '/token' => 'home#token', as: :token

  resources :home, only: :index
  resources :admins, only: :index

  root 'home#index'

end
