class Api::V1::SubscribeToController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json
  
 
  def create

    time = Time.new
    length = "6 months"
    temp = length.split(" ")
    
    #end_date = time +
    #new_subscription = SubscribedTo.create!(:user_id => current_user.id, :provider_id => params[:provider_id], :subscription_id => params[:subscription_id], :subscription_type => params[:subscription_type], :end_date => end_date)
    
    
    
    render :status => 200,
           :json => { :success => true,
                      :info => "Subscription Created",
                      :data => { :id => temp}#new_subscription.id  }
                    }
  end
  
end