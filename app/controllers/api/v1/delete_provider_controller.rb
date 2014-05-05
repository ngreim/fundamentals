class Api::V1::DeleteProviderController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json

  def create
    
    provider = Provider.find(params[:id])
    content_elements = ContentElement.find_by_provider_id(provider)
    
    if content_elements.nil?
      provider.destroy
      render :status => 200,
           :json => { :success => true,
             :info => "Provider Deleted",
             :data => { "names" => provider}
                    }
    else 
      render :status => 403,
           :json => { :success => false,
             :info => "Delete Failed",
             :data => {"names" => content_elements} }
    end
  end
end