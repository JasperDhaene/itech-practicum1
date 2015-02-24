class MessagesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @message = @event.messages.create(params[:message].permit(:person, :text, :date, :event))
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @message = @event.messages.find(params[:id])
    @message.destroy
    redirect_to event_path(@event)
  end

end
