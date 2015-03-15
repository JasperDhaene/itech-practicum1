class EventPeopleController < ApplicationController

  # POST /events/:event_id/people
  # Parameters: event_id, person => { id }
  def create
    @event = Event.find(params[:event_id])
    @person = Person.find(params[:person][:id])

    # Avoid duplicates
    unless @event.people.include?(@person)
      @event.people << @person
    end
    redirect_to @event
  end

  # DELETE /events/:event_id/people/:id
  def destroy
    @event = Event.find(params[:event_id])
    @person = Person.find(params[:id])

    @event.people.delete(@person)
    redirect_to @event
  end

end
