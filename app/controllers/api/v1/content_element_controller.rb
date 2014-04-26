class Api::V1::ContentElementController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json
  
  def index
    #subscriptions = SubscribedTo.where(:user_id => current_user.id).pluck(:provider_id)
        #subscriptions = SubscribedTo.where(:user_id => 1).pluck(:provider_id)
    provider_content_elements = ContentElements.where(:id => params[:provider_id])
    #content_elements = ContentElement.all
    
        render :status => 200,
                 :json => { :success => true,
                   :info => "Content Elements",
                   :data => {"content_elements" => provider_content_elements}
                          }
    end
  
 
  def create

    new_content_element = ContentElement.create!(:provider_id => params[:provider_id], :name => params[:name], :url_link => params[:url_link])
    render :status => 200,
           :json => { :success => true,
             :info => "Content Created",
             :data => { :name => new_content_element.name,
                       :provider_id => new_content_element.provider_id,
                       :url_link => new_content_element.url_link}
                    }
  end
  
end