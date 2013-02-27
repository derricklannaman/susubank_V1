module ApplicationHelper

  def signed_in
    if @authenticated_user
      link_to "Sign Out", signout_path
    else
      link_to "Sign In", signin_path
    end
  end

  def how_often_susu_is_paid_out
    if session[:pay_out_freq] == "1"
      @session_pay_out_freq = "weekly"
    elsif session[:pay_out_freq] == "2"
      @session_pay_out_freq = "every 2 weeks"
    else
      @session_pay_out_freq = "monthly"
    end
  end

  def how_often_members_contribute_to_susu
     if session[:pay_in_freq] == "1"
        @session_pay_in_freq = "weekly"
     elsif session[:pay_in_freq] == "2"
        @session_pay_in_freq = "every 2 weeks"
     else
        @session_pay_in_freq = "monthly"
     end
  end

  def get_session_info
    @session_name = session[:name]
    @session_pay_out = session[:pay_out]
    @session_num_of_members = session[:num_of_members]

    @session_info = [] << @session_name << @session_pay_out << @session_num_of_members
    @susu_labels = %w(Name Payout Members)
    @form_title = "+ New Susu"
  end

end
