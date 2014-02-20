class Organization < ActiveRecord::Base
  has_many :organization_admins
  has_many :teams
  has_many :follow_organizations
end
