class PostsController < ApplicationController
 
  def create
    @parcel = Parcel.find(params[:parcel_id])
    @post = Post.new(post_params)
    @post.parcel_id = @parcel.id
    @post.user_id = current_user.id
    if @post.save!

    redirect_to parcel_path(@parcel), notice: "Post created"
  else
    flash[:error] = "Problem!"
    redirect_to root_url
    end
  end
    
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :source, :user_id, :parcel_id)
    end
end
