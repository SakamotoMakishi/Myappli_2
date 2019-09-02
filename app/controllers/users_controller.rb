class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order('created_at DESC').limit(1)
  end

  def show
    user = User.with_attached_avatar.find(params[:id])
    @book = user.books
    book_data
  end
end
