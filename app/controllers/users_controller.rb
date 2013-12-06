class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Account created"
      self.current_user = @user
      redirect_to root_path
    
    else
      render :new
    end
  end
  def update
    @user = current_user
    if @user.save
      flash[:success] = "Account updated"
      redirect_to root_path
    else
      render :new
    end
  end


  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password_digest)
    end
end
