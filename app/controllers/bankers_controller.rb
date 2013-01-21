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
      redirect_to dashboard_path, confirm: "Banker successfully added"
    else
      render :new
    end
  end

  def show
    # @banker = Banker.find(params[:id])
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
    Banker.find(params[:id]).destroy
      redirect_to index_path
  end

end