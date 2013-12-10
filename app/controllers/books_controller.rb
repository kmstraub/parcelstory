class BooksController < ApplicationController
 
  def index
    @books = current_user.books
  end

  def show
    @book = Book.find(params[:id])
    @stories = Story.where(book_id: @book.id)
    @story = Story.new(book_id: @book.id)
    @parcel = @book.parcel_id



  end

  # GET /books/new
  def new
    @book = Book.new(parcel_id: params[:parcel_id])
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to @book
    else
      render :new
    end
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path
    else
      render 'edit'
    end
  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to root_url
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :body, :user_id, :parcel_id)
    end
end
