class PostsController < ApplicationController
 
  def create
    @parcel = Parcel.find(params[:parcel_id])
    @post = Post.new(post_params)
    @post.parcel_id = @parcel.id
    @post.user_id = current_user.id
    if @post.save!

    redirect_to parcel_path(@parcel), notice: "Post created."
  else
    flash[:error] = "Problem!"
    redirect_to parcel_path(@parcel)
    end
  end
  def destroy
    @parcel = Parcel.find(params[:parcel_id])
    @post = @parcel.posts.find(params[:id])
    @post.destroy
    redirect_to parcel_path(@parcel)
  end
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :source, :image)
    end
end
