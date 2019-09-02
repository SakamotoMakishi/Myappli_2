class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.includes(:user).order('created_at DESC').limit(40)
    @ranking = Book.includes(:user).find(Review.group(:book_id).order('count(book_id) desc').limit(10).pluck(:Book_id))
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
    params.require(:book).permit(:title,:review).merge(user_id: current_user.id)
  end
end
