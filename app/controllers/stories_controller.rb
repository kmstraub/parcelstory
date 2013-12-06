class StoriesController < ApplicationController
 

  def show

  end


  # GET /stories/1/edit
  def edit
  end

  
  def create
    book = Book.find(params[:book_id])
    parcel = book.parcel
    story = Story.new(story_params)
    story.book = book
    story.user = current_user
    story.parcel = parcel
    story.save!

    redirect_to book_path(book)
  end


 
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:body, :story_type, :source, :user_id, :book_id, :parcel_id)
    end
end
