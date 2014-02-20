class Api::V1::GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index
  myfollow = FollowTeam.find_by user_id: 5
  game = Game.first!
  render :status => 200,
           :json => { :success => true,
                      :info => "Logged in",
                      :data => { 
                      		   "game" => {
                           	      "id"=> 1,
                           	      "home_organization"=>"Iowa City City High",
                           	      "away_organization"=>"Dubuque Hempstead",
                           	      "home_score"=> game.home_score,
                           	      "away_score"=> game.away_score,
                        	      "sport"=>"basketball"
                        	    }
                               } 
                    }
	
  end
end
