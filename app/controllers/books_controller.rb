class BooksController < ApplicationController
 
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @stories = Story.where(book_id: @book.id)
    @story = Story.new
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  
  def create
    @parcel = Parcel.find(params[:parcel_id])
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :body, :user_id, :parcel_id)
    end
end
