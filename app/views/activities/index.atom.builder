atom_feed do |feed|
  feed.title("What's New on ShogiHub")
  feed.updated((@activities.first.created_at))

  @activities.each do |activity|
    next if activity.trackable.nil?
    case activity.trackable_type
    when 'News'
      feed.entry(activity, {url: news_url(activity.trackable)}) do |entry|
        category_header = activity.trackable.category >= 1 ? "JSA official | " : ""
        entry.title("NEWS | " + category_header + activity.trackable.title_en)
        entry.content(interpreted_content(activity.trackable, true).html_safe, type: 'html')
        entry.author do |author|
          author.name('ShogiHub')
        end
      end
    when 'Event'
      feed.entry(activity, {url: event_url(activity.trackable)}) do |entry|
        header = activity.key =~ /update/ ? 'Event Update' : 'EVENT'
        entry.title(header + " | " + activity.trackable.name + ' (' + activity.trackable.start_time.strftime("%Y-%m-%d") + ')')
        entry.content(interpret_markup(activity.parameters[:description]).html_safe, type: 'html') unless activity.parameters[:description] == nil
        entry.author do |author|
          author.name(activity.trackable.organizer)
        end
      end
    when 'Book'
      feed.entry(activity, {url: activity.trackable.url}) do |entry|
        entry.title("BOOK | " + activity.trackable.title + ' (' + activity.trackable.author + ', ' + activity.trackable.language.name + ')')
        entry.content(activity.trackable.description)
        entry.author do |author|
          author.name('ShogiHub')
        end
      end
    when 'Club'
      feed.entry(activity, {url: activity.trackable.url}) do |entry|
        entry.title("CLUB | " + activity.trackable.name + ' (' + activity.trackable.country.name + ')')
        entry.content(activity.trackable.address)
        entry.author do |author|
          author.name(activity.trackable.contact)
        end
      end
    when 'Website'
      feed.entry(activity, {url: activity.trackable.url}) do |entry|
        entry.title("PORTAL | " + activity.trackable.name + ' (' + activity.trackable.country.name + ')')
        entry.content(activity.trackable.description)
        entry.author do |author|
          author.name(activity.trackable.owner)
        end
      end
    else
    end
  end
end
