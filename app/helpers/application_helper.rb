module ApplicationHelper

  def signed_in
    if @authenticated_user
      link_to "Sign Out", signout_path
    else
      link_to "Sign In", signin_path
    end
  end

  def how_often_is_susu_paid_out
    if session[:pay_out_freq] == "1"
      @session_pay_out_freq = "weekly"
    elsif session[:pay_out_freq] == "2"
      @session_pay_out_freq = "every 2 weeks"
    else
      @session_pay_out_freq = "monthly"
    end
  end

  def how_often_do_members_contribute_to_susu
     if session[:pay_in_freq] == "1"
        @session_pay_in_freq = "weekly"
     elsif session[:pay_in_freq] == "2"
        @session_pay_in_freq = "every 2 weeks"
     else
        @session_pay_in_freq = "monthly"
     end
  end


end
