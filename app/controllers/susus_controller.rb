class SususController < ApplicationController

  def index
    @susus = @authenticated_user.susus.all
  end

  def new
    @susu = @authenticated_user.susus.new
  end


  def create
    @susu = @authenticated_user.susus.new(params[:susu])
    if @susu.save
      flash[:notice] = "Susu created!"
      redirect_to banker_susu_path(@authenticated_user, @susu)
    else
      flash[:error] = "Susu not created"
      render :new
    end
  end

  def show
    @susu = Susu.find(params[:id])
    @banker = @authenticated_user
  end

  def edit
    @susu = Susu.find(params[:id])
    @banker = @authenticated_user
  end

  def update
    @susu = Susu.find(params[:id])
    @banker = @authenticated_user
    @susu.update_attributes(params[:susu])
    flash[:notice] = "susu updated"
      redirect_to banker_susu_path(@banker, @susu)
  end

  def destroy
    @banker = Banker.find(params[:banker_id])

    Susu.find(params[:id]).destroy
      redirect_to @banker, notice: "susu deleted"
  end



end