class Api::V1::CreateProvidersController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json
  
  def index
        #subscriptions = SubscribedTo.where(:user_id => current_user.id).pluck(:provider_id)
        #subscriptions = SubscribedTo.where(:user_id => 1).pluck(:provider_id)
        #my_providers = Provider.where(:id => subscriptions) 
        my_providers = Provider.all
    
        render :status => 200,
                 :json => { :success => true,
                            :info => "My Subscriptions",
                            :data => {"providers" => my_providers}
                          }
        end
  
 
  def create

    new_provider = Provider.create!(:name => params[:name],:content_area_id => params[:content_area_id])
    render :status => 200,
           :json => { :success => true,
                      :info => "Provider Created",
                      :data => { :name => new_provider.name,
                                 :content_area_id => new_provider.content_area_id
                               }
                    }
  end
  
end

