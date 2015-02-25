class MessagesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @message = @event.messages.create(params[:message].permit(:person_id, :text, :date, :event_id))
    redirect_to event_path(@event)
  end

  def destroy
    @message = Message.find(params[:id])
    @event = @message.event
    @message.destroy
    redirect_to event_path(@event)
  end

  def edit
    @message = Message.find(params[:id])
    @event = @message.event
    @people = Person.all
  end

  def update
    @message = Message.find(params[:id])

    if @message.update(params[:message].permit(:person_id, :text, :date, :event_id))
      redirect_to @message.event
    else
      render 'edit'
    end
  end

end
