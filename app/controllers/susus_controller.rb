class SususController < ApplicationController

  def index
    @susus = Susu.all
  end

  def new
    @banker = Banker.find(params[:banker_id])
    @susu = Susu.new
  end

  def create
    @susu = Susu.new(params[:id])
    @banker = Banker.find(params[:banker_id])
    if @susu.save
      flash[:notice] = "Susu created!"
      redirect_to banker_susu_path(@banker, @susu)
    else
      flash[:notice] = "Susu not created"
      render :new
    end
  end

  def show
    @susu = Susu.find(params[:id])
  end

  def edit
    @susu = Susu.find(params[:id])
  end

  def update
    @susu = Susu.find(params[:id])
    @susu.update_attributes(params[:susu])
      redirect_to @susu
  end

  def destroy
    Susu.find(params[:id]).destroy
      redirect_to @banker, notice: "destroy this susu?"
  end


end