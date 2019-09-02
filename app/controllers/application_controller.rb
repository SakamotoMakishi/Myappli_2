class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #def after_sign_out_path_for(resource)
    #'books/index' # サインアウト後のリダイレクト先URL
  #end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:avatar])
  end

  def book_data
    @total = current_user.books.all.count
    # @last_book = current_user.books.last(1)
    # # book_week = current_user.books.group("DATE_FORMAT(created_at,'%Y-%m-%d %H:00:00')").count
    # # book_month = current_user.books.group("DATE_FORMAT(created_at,'%Y-%m-%d')").count
    # @book_week = book_week.values.last
    # @book_month = book_month.values.last
    #binding.pry
  end
end
