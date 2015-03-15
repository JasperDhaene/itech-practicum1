#
# Homepage
#

json.partial! 'events/events'

json.partial! 'people/people'

# All links to other parts of the site
json.links do
  json.events do
    json.href url_for(events_path)
  end

  json.people do
    json.href url_for(people_path)
  end
end
