class Api::V1::UpdateUserTypeController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json

  def create
        
    user = User.where(:email => "nathan-greim@uiowa.edu")
    
    #if user.user_type.nil?
      user.update_column(:user_type, 0)
      render :status => 200,
                 :json => { :success => true,
                            :info => "My Subscriptions",
                            :data => {"user" => user}
                          }
    #end
  end
end