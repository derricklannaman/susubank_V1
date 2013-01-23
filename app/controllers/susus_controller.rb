class SususController < ApplicationController

  def index
    @susus = Susu.all
  end

  def new
    @susu = Susu.new
  end

  def create
    @susu = Susu.new(params[:id])
    if @susu.save
      redirect_to banker_susus(@banker)
    else
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
      redirect_to banker_susu(@banker, @susu)
  end

  def destroy
    Susu.find(params[:id]).destroy
      redirect_to @banker, notice: "destroy this susu?"
  end



end