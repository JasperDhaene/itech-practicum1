json.people Person.all.each do |person|
  json.name person.name
  json.email person.email
  json.birthdate person.birthdate

  # All possible actions on a person (show, edit, update, destroy)
  json.actions do
    json.show do
      json.href url_for(person_path(person))
    end

    json.edit do
      json.href url_for(edit_person_path(person))
    end

    json.update do
      json.href url_for(person_path(person))
      json.method [:PUT, :PATCH]
    end

    json.delete do
      json.href url_for(person_path(person))
      json.method :DELETE
    end
  end
end

# All possible actions on the people#index page (new person)
json.actions do
  json.new do
    json.href url_for(new_person_path)
  end

  json.create do
    json.href url_for(people_path)
    json.method :POST
  end
end

# All links to other parts of the site
json.links do
  json.home do
    json.href url_for(:root)
  end

  json.events do
    json.href url_for(events_path)
  end
end
