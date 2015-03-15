#
# List event
#

json.event do
  json.title @event.title
    json.description @event.text
    json.startdate @event.startdate
    json.enddate @event.enddate

    # All people attending the event
    json.attending @event.people.each do |person|
      json.name person.name
      json.actions do
        json.show do
          json.href url_for(person_path(person))
        end

        json.delete do
          json.href url_for(event_person_path(@event, :id => person.id))
          json.method :DELETE
        end
      end
    end

    # All messages
    json.messages @event.messages.each do |message|
      json.author do
        json.name message.person.name
        json.href url_for(person_path(message.person_id))
      end

      json.text message.text
      json.date message.date

      json.actions do
        json.edit do
          json.href url_for(edit_event_message_path(@event, message))
        end

        json.update do
          json.href url_for(event_message_path(@event, message))
          json.method [:PUT, :PATCH]
        end

        json.delete do
          json.href url_for(event_message_path(@event, message))
          json.method :DELETE
        end
      end
    end

    # All possible actions (edit, delete, comment)
    json.actions do
      json.edit do
        json.href url_for(edit_event_path(@event))
      end

      json.delete do
        json.href url_for(event_path(@event))
        json.method :DELETE
      end

      json.comment do
        json.href url_for(event_messages_path(@event))
        json.method :POST
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
