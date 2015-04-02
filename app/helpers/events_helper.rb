module EventsHelper
  def event_status_td_tag(event)
    t = Time.new
    if event.canceled
      raw("<td style='background-color: #555'>")
    elsif event.report_url != nil && event.report_url != ""
      raw("<td style='background-color: #cef'>")
    elsif t > event.end_time + 24*60*60
      raw("<td>")
    elsif
      diff = event.start_time - t
      if (diff > 30*24*60*60)
        raw("<td>")
      else
        raw("<td style='font-weight:bold;color:red;'>")
      end
    end
  end

  def interpret_markup(text)
		lines = text.split("\n")
		new_lines = []
		hash = Hash.new(0)
		level = 2
		lines.each do |line|
			line.chomp!
      # html_escape "<" and """
      line = line.gsub(/\"/, "&quot;").gsub(/</, "&lt;")
			# interpret '''''text''''' as bold italic font
			line = line.gsub(/'''''(.+?)'''''/) {
				match = $1
				'<strong><i>' + match + '</i></strong>'
			}
			# interpret '''text''' as bold font
			line = line.gsub(/'''(.+?)'''/) {
				match = $1
				'<strong>' + match + '</strong>'
			}
			# interpret ''text'' as italic font
			line = line.gsub(/''(.+?)''/) {
				match = $1
				'<i>' + match + '</i>'
			}
      # interpret $br; as <br> tag
      line = line.gsub(/&lt;br>/,"<br>")
			# interpret [url( text)] as <a> tag link to an outside web
			line = line.gsub(/(https?:\/\/.+?)(\s|$)/) {
        link_to($1, $1, :class => 'external', :target => '_blank')
			}
			# interpret ===title=== as <h#> tag
			if (line =~ /^(=+)(.+?)(=+)$/)
				head = $1
				title = $2
				tail = $3
				new_line = ""
				if (hash[:ul] > 0)
					hash[:ul].times {	new_line += "</ul>" }
					hash[:ul] = 0
				end
				if (hash[:ol] > 0)
					hash[:ol].times {	new_line += "</ol>" }
					hash[:ol] = 0
				end
				if (hash[:p] > 0)
					new_line += "</div>"
					hash[:p] = 0
				end
				if (head.length == tail.length && head.length >= 2 && head.length <= 4)
					level = head.length + 1
					new_line += "<h" + level.to_s + ">" + title + "</h" + level.to_s + ">"
				end
			# interpret ***sentence as <ul><li> tag
			elsif (line =~ /^(\*+)(.+)$/)
				new_line = ""
				if (hash[:ol] > 0)
					hash[:ol].times {	new_line += "</ol>" }
					hash[:ol] = 0
				end
				if (hash[:p] == 0)
					new_line += "<div class='p level" + level.to_s + "'>"
					hash[:p] = 1
				end
				num = $1.length
				content = $2
				if (hash[:ul] < num)
					(num - hash[:ul]).times { new_line += "<ul class='article'>" }
					hash[:ul] = num
				elsif (hash[:ul] > num)
					(hash[:ul] - num).times { new_line += "</ul>" }
					hash[:ul] = num
				end
				new_line += "<li>" + content
			# interpret ###sentence as <ol><li> tag
			elsif (line =~ /^(#+)(.+)$/)
				new_line = ""
				if (hash[:ul] > 0)
					hash[:ul].times {	new_line += "</ul>" }
					hash[:ul] = 0
				end
				if (hash[:p] == 0)
					new_line += "<div class='p level" + level.to_s + "'>"
					hash[:p] = 1
				end
				num = $1.length
				content = $2
				if (hash[:ol] < num)
					(num - hash[:ol]).times { new_line += "<ol class='article'>" }
					hash[:ol] = num
				elsif (hash[:ol] > num)
					(hash[:ol] - num).times { new_line += "</ol>" }
					hash[:ol] = num
				end
				new_line += "<li>" + content
			# interpret double new-line as paragraph end
			elsif (line =~ /^\s*$/)
				new_line = ""
				if (hash[:ul] > 0)
					hash[:ul].times {	new_line += "</ul>" }
					hash[:ul] = 0
				end
				if (hash[:ol] > 0)
					hash[:ol].times {	new_line += "</ol>" }
					hash[:ol] = 0
				end
				if (hash[:p] > 0)
					new_line += "</div>"
					hash[:p] = 0
				end
			# Others
			else
				new_line = ""
				if (hash[:ul] > 0)
					hash[:ul].times {	new_line += "</ul>" }
					hash[:ul] = 0
				end
				if (hash[:ol] > 0)
					hash[:ol].times {	new_line += "</ol>" }
					hash[:ol] = 0
				end
				if (hash[:p] == 0)
					new_line += "<div class='p level" + level.to_s + "'>"
					hash[:p] = 1
				end	
				new_line += line + "<br>"
			end
			new_lines << new_line
		end
		new_line = ""
		# close <ul> block if needed
		hash[:ul].times {	new_line += "</ul>" } if (hash[:ul] > 0)
		# close <ol> block if needed
		hash[:ol].times {	new_line += "</ol>" } if (hash[:ol] > 0)
		new_line += "</div>" if (hash[:p] > 0)
		new_lines << new_line

		return new_lines.join("\n")
  end
end
