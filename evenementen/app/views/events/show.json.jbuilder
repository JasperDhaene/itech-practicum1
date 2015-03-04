# info about event
json.event do
	json.title @event.title
  	json.description @event.text
  	json.startdate @event.startdate
  	json.enddate @event.enddate
  	
  	# all people attending the event
  	json.attending @event.people.each do |person|
  		json.name person.name
  		json.actions do
  			json.show do
  				json.href url_for(person_path(person))
  			end
  			
  			# TODO Note: this will not delete a person, because it is impossible (for now) to pass a method via JSON
  			json.delete do 
  				json.href url_for(event_person_path(@event, :id => person.id))
  				json.method :delete
  			end
  		end
  	end
  	
  	# all messages
  	json.messages @event.messages.each do |message|
  		json.posted_by do
  			json.name message.person.name
  			json.href url_for(person_path(message.person_id))
  		end
  		json.text message.text		
  		json.date message.date
  		json.actions do
  			json.edit do
				json.href url_for(edit_event_message_path(@event, message))
			end
			
			json.delete do
			#no idea if this is at all useful, but it's the only thing that seems to work.
			json.href url_for(event_message_path(@event, message))
			json.method :delete
			end
  		end
  		# TODO note: what to do with new messages?
  	end
  	json.actions do
  		json.edit do
			json.href url_for(edit_event_path(@event))
		end
		
		json.delete do
		#no idea if this is at all useful, but it's the only thing that seems to work.
			json.href url_for(event_path(@event))
			json.method :delete
		end
  	end
end



# all links to other parts of the site. Useful for forming a path
json.links do
	json.home do
		json.href url_for(:root)
	end
	json.events do
		json.href url_for(events_path)
	end
	json.people do
		json.href url_for(people_path)
	end
end