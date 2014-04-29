class User < ActiveRecord::Base

before_save :ensure_authentication_token
 
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable,:confirmable, :lockable

 has_many :subscribed_tos
  has_many :ended_subscriptions 

def skip_confirmation!
  self.confirmed_at = Time.now
end

end
