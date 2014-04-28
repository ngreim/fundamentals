class Api::V1::SubscriptionTypeController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json


  def create

    new_subscription_type = SubscriptionType.create!(:provider_id => params[:provider_id], :name => params[:name], :subscription_length => params[:subscription_length], :hidden => 0)
    render :status => 200,
           :json => { :success => true,
             :info => "Subscription Type Created",
             :data => { "subscription type" => new_subscription_type}
                    }
  end
  
end