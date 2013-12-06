class ParcelsController < ApplicationController
 
  def index
    @parcels = Parcel.all
  end


  def show
    @parcel = Parcel.find(params[:id])
    @posts = Post.where(parcel_id: @parcel.id)
    @post = Post.new
  end

  # GET /parcels/new
  def new
    @parcel = Parcel.new
  end

  def create
    @parcel = Parcel.new(parcel_params)
    @parcel.user = current_user
    if @parcel.save
      redirect_to @parcel
    else
      render :new
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def parcel_params
      params.require(:parcel).permit(:address, :address_2, :city, :state, :zip, :neighborhood, :county, :name, :latitude, :longitude)
    end
end
