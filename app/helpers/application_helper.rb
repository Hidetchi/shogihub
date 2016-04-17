module ApplicationHelper
  def stars_tag(n, max=3)
    return "" if n == nil
    n = 0 if n < 0
    n = max if n > max
    tag = ""
    n.times do
      tag += image_tag('star.gif', class:'star')
    end
    raw(tag)
  end
end
