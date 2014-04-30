class Api::V1::GetProviderSubscriptionTypesController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json
  
  def create
    #subscriptions = SubscribedTo.where(:user_id => current_user.id).pluck(:provider_id)
        #subscriptions = SubscribedTo.where(:user_id => 1).pluck(:provider_id)
    provider_subscription_types = SubscriptionType.where(:provider_id => params[:provider_id])
    #content_elements = ContentElement.all
    
        render :status => 200,
                 :json => { :success => true,
                   :info => "Subscription Types",
                   :data => {"subscription_types" => provider_subscription_types}
                          }
    end
end