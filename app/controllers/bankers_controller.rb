class BankersController < ApplicationController

  def index
    @bankers = Banker.all
  end

  def new
    @banker = Banker.new
    get_form_title
  end

  def create
    @banker = Banker.new(params[:banker])
    if @banker.save
      flash[:notice] = "Banker account successfully created."
      redirect_to signin_path
    else
      get_form_title
      flash.now[:error] = "Banker account not created. Please try again."
      render :new
    end
  end

  def show
    get_banker
    @susus = @banker.susus.most_recent_first
  end

  def edit
    get_banker
    @form_title = "edit Banker info"
  end

  def update
    get_banker
    @banker.update_attributes(params[:banker])
      flash[:notice] = "Banker account successfully updated."
      redirect_to dashboard_path(@banker)
  end

  def destroy
    get_banker.destroy
      flash.now[:error] = "Account deleted."
      redirect_to root_path
  end


  def dashboard
    get_banker
    @susus = @banker.susus.most_recent_first
  end


  private


  def get_banker
    @banker = Banker.find(params[:id])
  end

  def get_form_title
    @form_title = "New Banker"
  end




  def susubuilder
    # @susu_name = params[:name]

    # Grab the info, place in session which allows info to persist to redirect
    # session[:name] = params[:name]
    # @susu = session[:name]

    # session[:num_of_members] = params[:num_of_members]

    # session[:pay_out] = params[:pay_out]

    # session[:pay_out_freq] = params[:pay_out_freq]

    # session[:pay_in_freq] = params[:pay_in_freq]
    # session[:pay_in_amount]

    @susu_name = params[:name]
    @total_hand = params[:pay_out].to_i
    # @members = params[:num_of_members].to_i
    # @pay_out_hand = params[:pay_out_freq].to_i
    # @member_pay_in = params[:pay_in_freq].to_i

    # @member_contribution = params[:member_contribution]

    # @new_susu_path = "new_banker_susu_path(@authenticated_user)"

  # CALCULATE MEMBER CONTRIBUTIONS FROM DROP DOWN LIST
    # when members pay in weekly and recv payouts weekly
    # if @member_pay_in == 1 && @pay_out_hand == 1
    #    @pay_in_amount = (@total_hand / @members)
    #    @member_pay_in = "weekly"
    #   elsif
    # # when members pay in weekly and recv payouts every 2 weeks
    #    @member_pay_in == 1 && @pay_out_hand == 2
    #    @pay_in_amount = (@total_hand / @members) / 2
    #    @member_pay_in = "weekly"
    #   elsif
    # # when members pay in weekly and recv payouts monthly
    #    @member_pay_in == 1 && @pay_out_hand == 3
    #    @pay_in_amount = (@total_hand / @members) / 4
    #    @member_pay_in = "weekly"
    #  elsif
    #    @member_pay_in == 2 && @pay_out_hand == 2
    #    @pay_in_amount = (@total_hand / @members)
    #    @member_pay_in = 'every 2 weeks'
    #  elsif
    #    @member_pay_in == 2 && @pay_out_hand == 3
    #    @pay_in_amount = (@total_hand / @members) / 2
    #    @member_pay_in = 'monthly'
    #   else
    #    @member_pay_in == 3 && @pay_out_hand == 3
    #    @pay_in_amount = (@total_hand / @members)
    #    @member_pay_in = "monthly"
    # end

    # CALCULATE SUSU DURATION
    # if @pay_out_hand == "weekly"
    #   num_of_weeks = 'weekly'

    #   @duration = @members * num_of_weeks
    # elsif @pay_out_hand == 'every 2 weeks'
    #   @duration = @members * 'every 2 weeks'
    # else
    #   @duration = @members * 4
    # end

    # @susubuilder = []
    # @susubuilder.push(@susu_name, @total_hand, @members, @pay_out_hand,
    #                   @member_pay_in, @pay_in_amount, @duration)

  end


  # def calculate
  #   raise params.inspect
  # end


end















