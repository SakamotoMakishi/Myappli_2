class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @book = Book.find(params[:book_id])
  end

  def create
    @review = Review.create(review_params)
    redirect_to controller: :reviews, action: :new
  end

  private
    def review_params
      params.require(:review).permit(:name, :rate, :review).merge(book_id: params[:book_id], user_id: current_user.id)
    end
end
