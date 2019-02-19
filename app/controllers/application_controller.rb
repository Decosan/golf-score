class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_category
  # Mix-in
  # https://techacademy.jp/my/rails/rails5/ruby#chapter-11-3
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def set_category
    @categories=Category.all
  end
  
 
end
