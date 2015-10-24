class Website < ActiveRecord::Base
  include PublicActivity::Common
  
  belongs_to :country
end
