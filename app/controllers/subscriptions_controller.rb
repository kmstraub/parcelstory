class SubscriptionsController < ApplicationController

	def create
		@parcel = Parcel.find(params[:parcel_id])
		@subscription = current_user.subscriptions.create!(:parcel_id => params[:parcel_id])
		redirect_to @parcel, notice: "Added subscription"
	end

	def destroy
		@subscription = current_user.subscriptions.find(params[:id])
		@subscription.destroy
		redirect_to root_url, notice: "Removed subscription"
	end
end

