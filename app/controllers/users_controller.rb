class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    if current_user
      redirect_to @user
    else
    @user = User.new
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for signing up for ParcelStory!"
    
    else
      render 'new'
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "Profile was successfully updated."
    else
      render action: 'edit'
    end
  end


  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
    end
end
