class Book < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :language
end
