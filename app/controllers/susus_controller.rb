class SususController < ApplicationController

  def index
    @susus = @authenticated_user.susus.order('susus.name desc')
    redirect_to @authenticated_user
  end

  def new

    @banker = Banker.find(params[:banker_id])
    @susu = Susu.new

  end


  def create
    @susu = @authenticated_user.susus.new(params[:susu])
    if @susu.save
      flash[:notice] = "The #{@susu.name} susu has been created"
      redirect_to banker_susu_path(@authenticated_user, @susu)
    else
      flash[:alert] = "Susu not created"
      render :new
    end
  end

  def show
    @susu = Susu.find(params[:id])
    @members = Member.all
    @banker = @authenticated_user
  end

  def edit
    @susu = Susu.find(params[:id])
    @banker = Banker.find(params[:banker_id])
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
      redirect_to banker_path(@banker), notice: "susu deleted"
  end


end