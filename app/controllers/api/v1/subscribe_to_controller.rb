class Api::V1::SubscribeToController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json
  
 
  def create

    time = Time.new
    length = "1 year"
    temp = length.split(" ")
    seconds = temp[0].to_i
    if temp[1].eql? "months" #|| temp[1].eql? "month"
      time_per_division = 2635200
    elsif temp[1].eql? "days" #|| temp[1].eql? "day"
      time_per_division = 86400
    else
      time_per_division = 31536000
    end
    seconds = seconds*time_per_division
    end_date = time + seconds
    
    if time < end_date
      test = "passed"
    else
      test = "failed"
    end
    #end_date = time +
    #new_subscription = SubscribedTo.create!(:user_id => current_user.id, :provider_id => params[:provider_id], :subscription_id => params[:subscription_id], :subscription_type => params[:subscription_type])
    
    
    
    render :status => 200,
           :json => { :success => true,
                      :info => "Subscription Created",
             :data => { :id => end_date,
               "test" => test}#new_subscription.id  }
                    }
  end
  
end