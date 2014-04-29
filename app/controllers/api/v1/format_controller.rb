class Api::V1::FormatController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json
  
  def index
        #subscriptions = SubscribedTo.where(:user_id => current_user.id).pluck(:provider_id)
        #subscriptions = SubscribedTo.where(:user_id => 1).pluck(:provider_id)
        #my_providers = Provider.where(:id => subscriptions) 
        my_formats = Format.all
    
        render :status => 200,
                 :json => { :success => true,
                            :info => "My Formats",
                            :data => {"Formats" => my_formats}
                          }
  end

  def create

    new_format = Format.create!(:name => params[:name], :hidden => 0)
    render :status => 200,
           :json => { :success => true,
             :info => "Format Created",
             :data => { "format" => new_format}
                    }
  end
  
  def destroy
    
    content = Format.find(params[:id])
    content_element = ContentElement.find_by_format_id(content.id)
    
    
    if content_element.nil?
      content.destroy
      render :status => 200,
             :json => { :success => true,
                        :info => "Content Element Deleted",
                        :data => { "formats" => content,
                                   "content elements" => content_element}
                    }
    else 
      render :status => 403,
             :json => { :success => false,
                        :info => "Delete Failed Content Element Still Has Format",
                        :data => {"formats" => content,
                                  "content elements" => content_element} }
    end
  end
  
  def update
   format = Format.find_by_id(params[:id])

    if format.hidden == 0
      format.update_column(:hidden, 1)
    elsif format.hidden == null
      format.update_column(:hidden, 0)
    else
      format.update_column(:hidden, 0)
    end
   #format.update_column(:away_score, params[:game][:away_score])

   render :status => 200,
           :json => { :success => true,
             :info => "Format Hidden",
                      :data => {"formats" => format} }   
  end
  
end