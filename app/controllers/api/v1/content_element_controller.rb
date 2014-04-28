class Api::V1::ContentElementController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json

 
  def create

    new_content_element = ContentElement.create!(:provider_id => params[:provider_id], :name => params[:name], :url_link => params[:url_link], :format_id => params[:format_id])
    render :status => 200,
           :json => { :success => true,
             :info => "Content Created",
             :data => { :name => new_content_element.name,
                       :provider_id => new_content_element.provider_id,
                       :url_link => new_content_element.url_link,
                       :format_id => new_content_element.format_id}
                    }
  end
  
  def destroy
    
    content = ContentElement.find(params[:id])
    #providers_content = Provider.find_by_content_area_id(content.id)

      content.destroy
      render :status => 200,
           :json => { :success => true,
             :info => "Content Element Deleted",
             :data => { "names" => content}
                    }

  end
  
end