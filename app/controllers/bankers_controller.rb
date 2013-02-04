class BankersController < ApplicationController

  def index
    @bankers = Banker.all
  end

  def new
    @banker = Banker.new
  end

  def create
    @banker = Banker.new(params[:banker])
    if @banker.save
      flash[:notice] = "Banker account successfully created."
      redirect_to @banker
    else
      render :new
    end
  end

  def show
    @banker = Banker.find(params[:id])
    # @susus = Susu.order('created_at desc')
    @susus = @authenticated_user.susus.order('created_at desc')

    # @authenticated_user = @banker
  end

  def edit
    @banker = Banker.find(params[:id])
  end

  def update
    @banker = Banker.find(params[:id])
    @banker.update_attributes(params[:banker])
      redirect_to banker_path(@banker)
  end

  def destroy
    @banker = Banker.find(params[:id]).destroy
      flash[:notice] = "Account deleted."
      redirect_to root_path
  end

  def susubuilder
    @susu_name = params[:name]
    @total_hand = params[:pay_out].to_i
    @members = params[:num_of_members].to_i
    @pay_out_frequency = params[:pay_out_freq]
    @pay_in_frequency = params[:pay_in_freq]

    @member_contribution = params[:member_contribution]

    @new_susu_path = "new_banker_susu_path(@authenticated_user)"

    # CALCULATE MEMBER CONTRIBUTIONS
    if @pay_in_frequency == "weekly"
      @pay_in_amount = (@total_hand / @members).to_f
    elsif @pay_in_frequency == "every 2 weeks"
      @pay_in_amount = (@total_hand / @members) * 2
      @pay_in_frequency = "every 2 weeks"
    else
      @pay_in_amount = (@total_hand / @members) * 4
      @pay_in_frequency = "monthly"
    end

    # CALCULATE SUSU DURATION
    if @pay_out_frequency == "weekly"
      @duration = @members * 1
    elsif @pay_out_frequency == "every 2 weeks"
      @duration = @members * 2
      @duration.to_f
    else
      @duration = @members * 4
    end





  end


end















