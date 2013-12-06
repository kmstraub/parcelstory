class PostsController < ApplicationController
 
  def create
    parcel = Parcel.find(params[:parcel_id])
    post = Post.new(post_params)
    post.parcel = parcel
    post.user = current_user
    post.save!

    redirect_to parcel_path(parcel)
  end
    
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :source, :user_id, :parcel_id)
    end
end
