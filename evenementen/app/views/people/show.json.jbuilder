# info about person
json.person do
	json.name @person.name
  	json.email @person.email
  	json.birthdate @person.birthdate
  	
  	# all the messages a person has posted
  	json.messages @person.messages.each do |message|
  		json.text message.text
  		json.date message.date
  		json.event do
  			json.title message.event.title
  			json.href url_for(event_path(message.event))
  		end
  	end
  	
  	# all the events a person is attending
  	json.events_attending  @person.events.each do |event|
  		json.title event.title
  		json.href url_for(event_path(event))
  	end
  	
  	json.actions do
  		json.edit do
			json.href url_for(edit_person_path(@person))
		end
		
		json.delete do
		#no idea if this is at all useful, but it's the only thing that seems to work.
			json.href url_for(person_path(@person))
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