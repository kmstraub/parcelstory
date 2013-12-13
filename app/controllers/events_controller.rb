class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end

  
  def show
  end

  # GET /events/new
  def new
    @parcel = Parcel.find(params[:parcel_id])
    @event = @parcel.events.new
  end

  def edit
    @parcel = @parcel.find(params[:parcel_id])
    @event = @parcel.events.find(params[:id])
  end

  def create
    @parcel = Parcel.find(params[:parcel_id])
    @event = Event.new(event_params)
    @event.parcel_id = @parcel.id
    @event.user_id = current_user.id
    if @event.save
      redirect_to parcel_path(@parcel), notice: "Event created."
    else
      flash[:error] = "Problem!"
      redirect_to parcel_path(@parcel)
    end
  end

  def update
    @parcel = Parcel.find(params[:parcel_id])
    @event = @parcel.events.find(params[:id])
    if @event.update(event_params)
      redirect_to parcel_path(@parcel)
    else
      render 'edit'
    end
  end

  def destroy
    @parcel = Parcel.find(params[:parcel_id])
    @event = @parcel.events.find(params[:id])
    @event.destroy
    redirect_to parcel_path(@parcel)
  end

  private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params[:event].permit(:when, :body, :source, :image)
    end
end
