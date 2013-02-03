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
    @susus = Susu.all
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
    # @banker = Banker.find(params[:id])

    @susu_name = params[:name]
    @total_hand = params[:pay_out]
    @members = params[:num_of_members]
    @pay_out_frequency = params[:pay_out_freq]
    @pay_in_frequency = params[:pay_in_freq]

    @member_contribution = params[:member_contribution]
    @duration = params[:duration]
    @new_susu_path = "new_banker_susu_path(@authenticated_user)"
  end

end