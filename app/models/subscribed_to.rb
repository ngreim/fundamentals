class SubscribedTo < ActiveRecord::Base
  belongs_to :user
  belongs_to :provider
  has_many :subscription_types
end
