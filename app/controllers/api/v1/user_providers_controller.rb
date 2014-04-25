class Api::V1::UserProvidersController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json

  def index
        subscriptions = SubscribedTo.where(:user_id => current_user.id).pluck(:provider_id)
        my_providers = Provider.where(:id => subscriptions) 

	render :status => 200,
           :json => { :success => true,
                      :info => "My Subscriptions",
                      :data => {

                                   "providers" => my_providers
                                   
                               }
                    }
  end
  
  def create
    build_resource(provider_params)
    resource.skip_confirmation!
    #new_provider = Provider.create!(:name => name )
    render :status => 200,
           :json => { :success => true,
                      :info => "Provider Created",
             :data => { :name => resource  }
                    }
  end
  
  def provider_params
    params.require(:name)
  end


end
