#add Header links
json.events Event.all do |event|
  json.title event.title
  json.description event.text
  json.startdate event.startdate
  json.enddate event.enddate
  #add edit and destroy links
end