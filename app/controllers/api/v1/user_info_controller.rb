class Api::V1::UserInfoController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json

  def index
        
    #user = User.where(:user_id => current_user.id)
    user = Provider.where(:id => params[:provider_id])
        #subscriptions = SubscribedTo.where(:user_id => 1).pluck(:provider_id)
        #my_providers = Provider.where(:id => subscriptions) 
        #my_providers = Provider.all

    
        render :status => 200,
                 :json => { :success => true,
                            :info => "My Subscriptions",
                            :data => {"user" => user}
                          }
        end
end