class ContentElement < ActiveRecord::Base
  belongs_to :providers
  belongs_to :Format
end
