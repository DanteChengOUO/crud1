class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save 
      redirect_to books_path ,  notice:'新增成功'
    else
      render :new 
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
   
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path ,notice:'修改成功'
    else
      render :edit ,notice: '修改失敗'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: '刪除成功'
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:name ,:price)
  end


end
