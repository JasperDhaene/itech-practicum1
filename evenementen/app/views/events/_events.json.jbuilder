json.events Event.all do |event|
  json.title event.title
  json.description event.text
  json.startdate event.startdate
  json.enddate event.enddate

  # All possible actions on an event (show, edit, update, destroy)
  json.actions do
    json.show do
      json.href url_for(event_path(event))
    end

    json.edit do
      json.href url_for(edit_event_path(event))
    end

    json.update do
      json.href url_for(event_path(event))
      json.method [:PUT, :PATCH]
    end

    json.delete do
      json.href url_for(event_path(event))
      json.method :DELETE
    end
  end
end

# All possible actions on the events#index page (new, create)
json.actions do
  json.new do
    json.href url_for(new_event_path)
  end

  json.create do
    json.href url_for(events_path)
    json.method :POST
  end
end

# All links to other parts of the site
json.links do
  json.home do
    json.href url_for(:root)
  end

  json.people do
    json.href url_for(people_path)
  end
end
