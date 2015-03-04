#listing all events
json.events Event.all do |event|
  json.title event.title
  json.description event.text
  json.startdate event.startdate
  json.enddate event.enddate
  
  #all possible actions on an event (show,edit,destroy)
  json.actions do
	json.show do
		json.href url_for(event_path(event))
	end
	json.edit do
		json.href url_for(edit_event_path(event))
	end
	json.delete do
		#no idea if this is at all useful, but it's the only thing that seems to work.
		json.href url_for(event_path(event))
		json.method :delete
	end
  end
end

# listing all people
json.people Person.all.each do |person|
  json.name person.name
  json.email person.email
  json.birthdate person.birthdate
  
  #all possible actions on a person (show,edit,destroy)
  json.actions do
	json.show do
		json.href url_for(person_path(person))
	end
	json.edit do
		json.href url_for(edit_person_path(person))
	end
	json.delete do
		#no idea if this is at all useful, but it's the only thing that seems to work.
		json.href url_for(person_path(person))
		json.method :delete
	end
  end
end

# all links to other parts of the site. Useful for forming a path
json.links do
	json.events do
		json.href url_for(events_path)
	end
	json.people do
		json.href url_for(people_path)
	end
end