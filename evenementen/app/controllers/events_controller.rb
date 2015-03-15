class EventsController < ApplicationController

  # GET /events
  def index
  end

  # POST /events
  # Parameters: title, text, startdate, enddate
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/:id/edit
  def edit
    @event = Event.find(params[:id])
  end

  # GET /events/:id
  def show
    @event = Event.find(params[:id])
    @message = Message.new
  end

  # PUT/PATCH /events/:id
  # Parameters: title, text, startdate, enddate
  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  # DELETE /events/:id
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  # Event permitted parameters
  private
  def event_params
     params.require(:event).permit(:title, :text, :startdate, :enddate)
  end

end
