module CountriesHelper
  def flag_80_tag(code)
    image_tag(sprintf("flags_80/%03d.jpg", code))
  end
end
