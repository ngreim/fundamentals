class Api::V1::GetProviderContentElementsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json
  
  def create
    #subscriptions = SubscribedTo.where(:user_id => current_user.id).pluck(:provider_id)
        #subscriptions = SubscribedTo.where(:user_id => 1).pluck(:provider_id)
    provider_content_elements = ContentElement.where(:provider_id => params[:provider_id])
    #content_elements = ContentElement.all
    
        render :status => 200,
                 :json => { :success => true,
                   :info => "Content Elements",
                   :data => {"content_elements" => provider_content_elements}
                          }
    end
  
  def update
    content_elements = ContentElement.find(params[:id])

    if content_elements.hidden == 0
      content_elements.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Content Element Hidden",
                      :data => {"content_elements" => content_elements} } 
    elsif content_elements.hidden.nil?
      content_elements.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Content Element Hidden",
                      :data => {"content_elements" => content_elements} } 
    else
      content_elements.update_column(:hidden, 0)
      render :status => 200,
           :json => { :success => true,
             :info => "Content Element Unhidden",
                      :data => {"content_elements" => content_elements} } 
    end 
  end
end