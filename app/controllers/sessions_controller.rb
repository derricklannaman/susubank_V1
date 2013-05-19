class SessionsController < ApplicationController
  def new
  end

  def create
    # banker = Banker.find_by_banker_email(params[:banker_email])
    # if banker && banker.authenticate(params[:password])
    #   session[:user_id] = banker.id
    #   flash[:notice] = "You are now signed in."
    #   redirect_to banker_path(banker)
    # else
    #   flash[:error] = "Oops! Something went wrong. Please try again."
    #   render :new
    # end

    banker = Banker.from_omniauth(env["omniauth.auth"])
    session[:user_id]= banker.id
    redirect_to banker_path(banker)
  end

    # def create
    # if signed_in_with_facebook?
    #   banker = Banker.from_omniauth(env["omniauth.auth"])
    #   session[:user_id]= banker.id
    #   redirect_to banker_path(banker)
    # else
    #   banker = Banker.find_by_banker_email(params[:banker_email])
    #   if banker && banker.authenticate(params[:password])
    #     session[:user_id] = banker.id
    #     flash[:notice] = "You are now signed in."
    #     redirect_to banker_path(banker)
    #   else
    #     flash[:error] = "Oops! Something went wrong. Please try again."
    #     render :new
    #   end
    # end


    # banker = Banker.from_omniauth(env["omniauth.auth"])
    # session[:user_id]= banker.id
    # redirect_to banker_path(banker)
  # end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out."
    redirect_to root_path
  end

  def signed_in_with_facebook?
   not @authenticated_user.oauth_token.nil?
  end

end
