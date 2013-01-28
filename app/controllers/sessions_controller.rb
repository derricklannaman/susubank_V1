class SessionsController < ApplicationController
  def new
  end

  def create

    banker = Banker.find_by_banker_email(params[:banker_email])
    if banker && banker.authenticate(params[:password])
      session[:user_id] = banker.id
      flash[:notice] = "You are now logged in."
      redirect_to banker_path(banker)
    else
      flash[:notice] = "Something went wrong. Please try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end

end
