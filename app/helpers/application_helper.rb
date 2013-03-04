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

  def member_since
    time = @authenticated_user.created_at
    time.strftime('%m/%d/%Y')
  end

  def get_todays_date
    today = Time.now
    today.strftime('%m/%d/%Y')
  end

  # Stats for susus

  def total_value_of_a_bankers_susus
    @authenticated_user.susus.map(&:pay_out_amount).reduce(:+)
  end

  def total_number_of_susus
    @authenticated_user.susus.count
  end

  def avg_susu_dollar_value(number_of_susus)
    dollar_value = @authenticated_user.susus.map(&:pay_out_amount).reduce(:+)
    dollar_value / total_number_of_susus
  end

  def total_number_of_members
    @authenticated_user.susus.map(&:num_of_members).reduce(:+)
  end

  def avg_number_of_members(total_members, number_of_susus)
    total_number_of_members / total_number_of_susus
  end




end
