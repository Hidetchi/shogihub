atom_feed do |feed|
  feed.title("ShogiHub Updates | World Shogi Events")
  feed.updated((@events.first.updated_at))

  @events.each do |event|
    feed.entry(event, {url: event_url(event), published: event.updated_at}) do |entry|
      entry.title(event.name + ' (' + event.start_time.strftime("%Y-%m-%d") + ')')
      entry.content(interpret_markup(event.description).html_safe, type: 'html')
      entry.author do |author|
        author.name(event.organizer)
      end
    end
  end
end
