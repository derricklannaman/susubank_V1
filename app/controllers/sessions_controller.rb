class SessionsController < ApplicationController
  def new
  end

  def create
    banker = Banker.where(:banker_email => params[:banker_email]).first || Banker.from_omniauth(env["omniauth.auth"])
    # if banker && banker.authenticate(params[:password])
      session[:user_id] = banker.id
      flash[:notice] = "You are now signed in."
      redirect_to banker_path(banker)
    # else
    #   flash[:error] = "Oops! Something went wrong. Please try again."
    #   render :new
    # end
  end

  # def admin_sign_in?
  #   if @banker && @banker.authenticate(params[:password])
  #     session[:user_id] = @banker.id
  #   end
  # end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out."
    redirect_to root_path
  end

end
