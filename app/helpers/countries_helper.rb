module CountriesHelper
  def flag_80_tag(code)
    image_tag(sprintf("flags_80/%03d.jpg", code))
  end

  def flag_3d_tag(code)
    image_tag(sprintf("flags_3d/%03d.jpg", code), :width => '160')
  end
end
