class SususController < ApplicationController

  def index
    @susus = Susu.all
    @banker = Banker.find(params[:banker_id])
  end

  def new
    @banker = Banker.find(params[:banker_id])
    @susu = Susu.new
  end

  def create
    # @susu = Susu.new(params[:id])

    @banker = Banker.find(params[:banker_id])
    @susu = @banker.susus.new(params[:susu])
    if @susu.save
      flash[:notice] = "Susu created!"
      redirect_to banker_susu_path(@banker, @susu)
    else
      flash[:error] = "Susu not created"
      render :new
    end
  end

  def show
    @susu = Susu.find(params[:id])
    @banker = Banker.find(params[:banker_id])
  end

  def edit
    @susu = Susu.find(params[:id])
    @banker = Banker.find(params[:banker_id])
  end

  def update
    @susu = Susu.find(params[:id])
    @banker = Banker.find(params[:banker_id])
    @susu.update_attributes(params[:susu])
    flash[:notice] = "susu updated"
      redirect_to banker_susu_path(@banker, @susu)
  end

  def destroy
    @banker = Banker.find(params[:banker_id])

    Susu.find(params[:id]).destroy
      redirect_to @banker, notice: "destroy this susu?"
  end



end