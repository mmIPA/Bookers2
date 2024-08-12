class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = current_user.books
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    puts book_params.inspect
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to'/books'
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
