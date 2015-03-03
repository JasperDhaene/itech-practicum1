class MessagesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    if @event.messages.create(message_params)
      redirect_to @event
    else
      render 'new'
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @event = @message.event
    @message.destroy
    redirect_to @event
  end

  def edit
    @message = Message.find(params[:id])
    @event = @message.event
  end

  def update
    @message = Message.find(params[:id])
    @event = @message.event

    if @message.update(message_params)
      redirect_to @message.event
    else
      render 'edit'
    end
  end

  private
  def message_params
     params.require(:message).permit(:person_id, :text, :date, :event_id)
  end

end
