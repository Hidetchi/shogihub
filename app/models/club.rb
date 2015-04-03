class Club < ActiveRecord::Base
  belongs_to :country
  geocoded_by :address
  after_validation :geocode_if_blank

  private

    def geocode_if_blank
      geocode if self.address != nil && self.address != "" && (self.longitude == nil || self.latitude == nil)
    end

end
