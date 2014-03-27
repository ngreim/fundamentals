class Team < ActiveRecord::Base
  belongs_to :organization
  has_many :home_teams
  has_many :away_teams
  has_many :follow_teams
end
