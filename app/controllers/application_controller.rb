class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user


  private

  # def current_user
  #   @current_user = Banker.find(session[:user_id]) if session[:user_id]
  # end

  def authenticate_user
    if session[:user_id]
      @authenticated_user = Banker.find(session[:user_id])
    else
      @authenticated_user = nil
    end
  end
   helper_method :authenticate_user
   # helper_method :current_user
end
