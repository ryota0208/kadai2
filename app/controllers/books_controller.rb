class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to @book
    else
      @books = Book.all
      render "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to @book
    else
      render "edit"
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_url
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
