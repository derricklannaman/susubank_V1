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

  def calculate_member_contribution
    # CALCULATE MEMBER CONTRIBUTIONS FROM DROP DOWN LIST FOR JS
    if @member_pay_in == 1 && @pay_out_hand == 1
       @pay_in_amount = (@total_hand / @members)
       @member_pay_in = "weekly"
    elsif
       # @pay_out_hand == 'every 2 weeks' && @member_pay_in == 'weekly'
       @member_pay_in == 1 && @pay_out_hand == 2
       @pay_in_amount = (@total_hand / @members) / 2
       @member_pay_in = "weekly"
    elsif
       # @pay_out_hand == 'monthly' && @member_pay_in == 'weekly'
       @member_pay_in == 1 && @pay_out_hand == 3
       @pay_in_amount = (@total_hand / @members) / 4
       @member_pay_in = "weekly"
    elsif
       @member_pay_in == 2 && @pay_out_hand == 2
       @pay_in_amount = (@total_hand / @members) / 2
       @member_pay_in = 'every 2 weeks'
    else
       @member_pay_in == 3 && @pay_out_hand == 3
       @pay_in_amount = (@total_hand / @members) * 4
       @member_pay_in = "monthly"
    end
  end


end
