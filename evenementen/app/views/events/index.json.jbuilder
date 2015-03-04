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
		
		#non-working version of a delete-link. Try to remove the HTML formatting from this output.
		#json.href link_to(event_path(event), method: :delete)
	end
  end
end

# all possible actions on the events#index page (new event)
json.actions do
	json.new do
		json.href url_for(new_event_path) 	
	end
end

# all links to other parts of the site. Useful for forming a path
json.links do
	json.home do
		json.href url_for(:root)
	end
	json.people do
		json.href url_for(people_path)
	end
end







	

  



