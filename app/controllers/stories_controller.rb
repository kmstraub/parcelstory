class StoriesController < ApplicationController
 

  def show
    @story = Story.find(params[:id])
  end


  # GET /stories/1/edit
  def edit
    @book = Book.find(params[:book_id])
    @story = @book.stories.find(params[:id])
  end

  
  def create
    @book = Book.find(params[:book_id])
    @story = Story.new(story_params)
    @story.book = @book
    @story.user_id = current_user.id
    @story.save!

    redirect_to book_path(@book)
  end

  def update
    @book = Book.find(params[:book_id])
    @story = @book.stories.find(params[:id])
    if @story.update(story_params)
      redirect_to book_path
    else
      render 'edit'
    end
  end
  def destroy
      @book = Book.find(params[:book_id])
      @story = @book.stories.find(params[:id])
      @story.destroy
      redirect_to book_path(@book)
  end

 
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:body, :story_type, :source, :image)
    end
end
