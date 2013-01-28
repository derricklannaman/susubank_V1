class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user


  private

  def authenticate_user
    if session[:user_id]
      @authenticated_user = Banker.find(session[:user_id])
    else
      @authenticated_user = nil
    end
  end

end
