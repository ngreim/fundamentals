class Api::V1::AdminGamesController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index
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

  def update
   game = Game.find(params[:game][:id])

   game.update_column(:home_score, params[:game][:home_score])
   game.update_column(:away_score, params[:game][:away_score])

   render :status => 200,
           :json => { :success => true,
                      :info => "Update Score",
                      :data => {} }   
  end
end
