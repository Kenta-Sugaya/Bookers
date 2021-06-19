class BooksController < ApplicationController
  
  
  def top
  end
  def index
    @books = Book.all.order("id ASC")
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
     redirect_to book_path(@book)
      flash[:notice]= 'Book was successfully created.'
    else
      
      @books = Book.all
      # @book=Book.new
      render :index
    end
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    
    
  end

  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
    
  end

  def destroy
  @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice]="Book was successfully destroyed."
      redirect_to books_path
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
