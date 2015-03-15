class MessagesController < ApplicationController

  # POST /events/:event_id/messages
  # Parameters: person_id, event_id, text, date
  def create
    @event = Event.find(params[:event_id])
    if @event.messages.create(message_params)
      redirect_to @event
    else
      render 'new'
    end
  end

  # GET /events/:event_id/messages/:id/edit
  def edit
    @message = Message.find(params[:id])
    @event = @message.event
  end

  # PUT/PATCH /events/:event_id/messages/:id
  def update
    @message = Message.find(params[:id])
    @event = @message.event

    if @message.update(message_params)
      redirect_to @message.event
    else
      render 'edit'
    end
  end

  # DELETE /events/:event_id/messages/:id
  def destroy
    @message = Message.find(params[:id])
    @event = @message.event
    @message.destroy
    redirect_to @event
  end

  # Message allowed parameters
  private
  def message_params
     params.require(:message).permit(:person_id, :text, :date, :event_id)
  end

end
