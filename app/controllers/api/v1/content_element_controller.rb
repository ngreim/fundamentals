class Api::V1::ContentElementController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json
  
  def index
    content_elements = ContentElement.all
    
        render :status => 200,
                 :json => { :success => true,
                   :info => "Content Elements",
                            :data => {"content elements" => content_elements}
                          }
        end

 
  def create
    hidden = 0
    new_content_element = ContentElement.create!(:provider_id => params[:provider_id], :name => params[:name], :url_link => params[:url_link], :format_id => params[:format_id], :format_type => params[:format_type], :hidden => hidden)
    render :status => 200,
           :json => { :success => true,
             :info => "Content Created",
             :data => { "content element" => new_content_element}
                    }
  end
  
  #def destroy
    
    #content = ContentElement.find(params[:id])
    #provider = content.provider_id
    #users = SubscribedTo.where(:provider_id => provider)

    #if users.nil?
     # content.destroy
      #render :status => 200,
       #    :json => { :success => true,
        #     :info => "Content Element Deleted",
         #    :data => { "names" => content}
                    #}
    #else
      #render :status => 403,
       #      :json => { :success => false,
        #       :info => "Delete Failed User subscribed to Content Provider",
         #               :data => {"names" => content,
          #                "users" => users} }
    #end

  #end
  
  def update
    content = ContentElement.find(params[:id])

    if content.hidden == 0
      content.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Content Element Hidden",
                      :data => {"content" => content} } 
    elsif content.hidden.nil?
      content.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Content Element Hidden",
                      :data => {"content" => content} } 
    else
      content.update_column(:hidden, 0)
      render :status => 200,
           :json => { :success => true,
             :info => "Content Element Unhidden",
                      :data => {"content" => content} } 
    end 
  end
  
end