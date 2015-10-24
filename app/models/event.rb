class Event < ActiveRecord::Base
  include PublicActivity::Common

  has_many :event_players
  has_many :players, through: :event_players
  accepts_nested_attributes_for :event_players, allow_destroy: true
  belongs_to :country
  geocoded_by :address
  after_validation :geocode_if_blank

  def description_preview
    if self.description.length > 70
      self.description[0..69] + "..."
    else
      self.description
    end
  end

  def time_slot
    str = self.start_time.strftime("%Y-%m-%d %H:%M") + "  ~  "
    if (self.start_time.strftime("%m-%d") == self.end_time.strftime("%m-%d"))
      str += self.end_time.strftime("%H:%M")
    else
      str += self.end_time.strftime("%Y-%m-%d %H:%M")
    end
    str
  end

  def status
    t = Time.new
    if self.canceled
      "Canceled"
    elsif self.report_url != nil && self.report_url != ""
      ("<a href='" + self.report_url + "' target='_blank' class='external'>Report</a>").html_safe
    elsif t > self.end_time + 24*60*60
      "Ended"
    elsif
      diff = self.start_time - t
      if (diff > 3*365*24*60*60)
        sprintf("In %d years", diff.div(365*24*60*60))
      elsif (diff > 2*30*24*60*60)
        sprintf("In %d months", diff.div(30*24*60*60))
      elsif (diff > 24*60*60)
        sprintf("In %d days", diff.div(24*60*60))
      else
        "Now!!"
      end
    end
  end

  private

    def geocode_if_blank
      geocode if self.address != nil && self.address != "" && (self.longitude == nil || self.latitude == nil)
    end

end
