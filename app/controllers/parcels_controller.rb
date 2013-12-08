class ParcelsController < ApplicationController
 
  def index
    @parcels = Parcel.all
  end


  def show
    @parcel = Parcel.find(params[:id])
    @posts = Post.where(parcel_id: params[:id])
    @post = Post.new(parcel_id: params[:id])
  end

  # GET /parcels/new
  def new
    @parcel = Parcel.new
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
