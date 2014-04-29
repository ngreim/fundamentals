class Api::V1::UserProvidersController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json

  def index
        time = Time.new
        all_subscriptions = SubscribedTo.all
        temp =0
        all_subscriptions.each do |i|
          time2 = all_subscriptions[i].end_date
          if time2 < time
            temp = temp +1
          end
        end
    
        subscriptions = SubscribedTo.where(:user_id => current_user.id).pluck(:provider_id)
        #subscriptions = SubscribedTo.where(:user_id => 1).pluck(:provider_id)
        my_providers = Provider.where(:id => subscriptions) 
        #my_providers = Provider.all

    
        render :status => 200,
                 :json => { :success => true,
                            :info => "My Subscriptions",
                            :data => {"providers" => my_providers,
                              :temp => temp}
                          }
        end
  
  def destroy
    
    provider = Provider.find(params[:id])
    content_elements = ContentElement.find_by_provider_id(provider)
    #delivery.destroy
    
    if content_elements.nil?
      provider.destroy
      render :status => 200,
           :json => { :success => true,
             :info => "Delivery Mode Deleted",
             :data => { "names" => provider}
                    }
    else 
      render :status => 403,
           :json => { :success => false,
             :info => "Delete Failed Provider Doesnt Exist",
             :data => {"names" => content_elements} }
    end
  end
end
