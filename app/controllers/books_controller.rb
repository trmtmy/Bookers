class BooksController < ApplicationController
  def index
    @Books = Book.all
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book)
    flash[:notice] = "Book was successfully created."
    else
    @books = Book.all
    render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    flash[:notice] = "Book was successfully updated."
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
