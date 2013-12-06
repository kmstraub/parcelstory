class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			flash[:success] = "Signed in"
			self.current_user = user
			redirect_to root_path
		else
			flash[:error] = "Wrong email or password"
			render :new
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
