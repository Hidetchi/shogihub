module CountriesHelper
  def flag_s_tag(code)
    image_tag(sprintf("flags_s/%03d.gif", code), :style => 'margin-right:8px;vertical-align:text-bottom;')
  end

  def flag_ss_tag(code)
    image_tag(sprintf("flags_ss/%03d.png", code), :style => 'margin-right:8px;vertical-align:baseline;')
  end

  def flag_80_tag(code)
    image_tag(sprintf("flags_80/%03d.jpg", code))
  end

  def flag_3d_tag(code)
    image_tag(sprintf("flags_3d/%03d.jpg", code), :width => '160')
  end
end
