class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.order('created_at DESC').limit(3)
    @ranking = Book.includes(:user).find(Review.group(:book_id).order('count(book_id) desc').limit(10).pluck(:book_id))
    if user_signed_in?
      book_data
    end
  end

  def show
    @book = Book.includes(:user).find(params[:id])
  end

  def create
    @book = Book.create(form_params)
    redirect_to root_path
  end

  private
  def form_params
    params.require(:book).permit(:title,:review,:image).merge(user_id: current_user.id)
  end
end
