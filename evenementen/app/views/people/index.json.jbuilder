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

# all possible actions on the people#index page (new person)
json.actions do
	json.new do
		json.href url_for(new_person_path) 	
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
end







	

  



