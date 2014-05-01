class Api::V1::DeleteSubscriptionController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json

  def create
    
    subscription = SubscribedTo.find(params[:id])
    #providers_content = Provider.find_by_content_area_id(content.id)

      subscription.destroy
      render :status => 200,
           :json => { :success => true,
             :info => "Subscription Deleted",
             :data => { "subscription" => subscription}
                    }
  end
end