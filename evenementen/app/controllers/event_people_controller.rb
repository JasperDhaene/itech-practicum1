class EventPeopleController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @person = Person.find(params[:id][:id])

    # Avoid duplicates
    unless @event.people.include?(@person)
      @event.people << @person
    end
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event_id])
    @person = Person.find(params[:id])

    @event.people.delete(@person)
    redirect_to @event
  end

end
