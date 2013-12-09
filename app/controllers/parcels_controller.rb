class ParcelsController < ApplicationController
 
  def index
    @parcels = Parcel.all
  end


  def show
    @parcel = Parcel.find(params[:id])
    @posts = Post.where(parcel_id: params[:id])
    @post = Post.new(parcel_id: params[:id])
    @events = Event.where(parcel_id: params[:id])
    @event = Event.new(parcel_id: params[:id])
    @subscribers= Subscription.where(parcel_id: @parcel.id)

  end

  # GET /parcels/new
  def new
    @parcel = Parcel.new
  end

  def edit
    @parcel = Parcel.find(params[:id])
  end

  def update
    @parcel = Parcel.find(params[:id])
    if @parcel.update(parcel_params)
      redirect_to parcel_path
    else
      render 'edit'
    end
  end

  def create
    @parcel = Parcel.new(parcel_params)
    @parcel.user_id = current_user.id
    if @parcel.save
        redirect_to @parcel
    else
        render :new
    end
  end
  def destroy
    @parcel = Parcel.find(params[:id])
    @parcel.destroy
    redirect_to parcels_path
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def parcel_params
      params.require(:parcel).permit(:address, :address_2, :city, :state, :zip, :neighborhood, :county, :name, :latitude, :longitude)
    end
end
