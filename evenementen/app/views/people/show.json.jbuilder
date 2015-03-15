#
# List person
#

json.person do
  json.name @person.name
    json.email @person.email
    json.birthdate @person.birthdate

    # All the messages a person has posted
    json.messages @person.messages.each do |message|
      json.text message.text
      json.date message.date

      json.event do
        json.title message.event.title
        json.href url_for(event_path(message.event))
      end
    end

    # All the events a person is attending
    json.events_attending  @person.events.each do |event|
      json.title event.title
      json.href url_for(event_path(event))
    end

    # All possible actions
    json.actions do
      json.edit do
        json.href url_for(edit_person_path(@person))
      end

      json.update do
        json.href url_for(person_path(@person))
        json.method [:PUT, :PATCH]
      end

      json.delete do
        json.href url_for(person_path(@person))
        json.method :DELETE
      end
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

  json.people do
    json.href url_for(people_path)
  end
end
