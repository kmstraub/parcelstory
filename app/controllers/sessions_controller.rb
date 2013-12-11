class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to parcels_path, notice: "Logged in!"
		else
			flash[:error] = "Wrong email or password"
			redirect_to root_url
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Logged out."
	end
end
