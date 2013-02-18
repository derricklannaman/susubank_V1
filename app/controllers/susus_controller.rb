class SususController < ApplicationController

  helper_method :cookies

  def index
    @susus = @authenticated_user.susus.order('susus.name desc')
    redirect_to @authenticated_user
  end

  def new
    @banker = Banker.find(params[:banker_id])
    @susu = Susu.new
    session[:name]
  end

  def create
    @susu = @authenticated_user.susus.new(params[:susu])
    if @susu.save
      redirect_to banker_susu_path(@authenticated_user, @susu), notice: "#{@susu.name} Susu created"
    else
      render :new, alert: "Susu not created"
    end
  end

  def show
    @susu = Susu.find(params[:id])
    @members = @susu.members
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
      redirect_to banker_susu_path(@banker, @susu), notice: "Susu updated"
  end

  def destroy
    @banker = Banker.find(params[:banker_id])
    Susu.find(params[:id]).destroy
      redirect_to banker_path(@banker), notice: "Susu deleted"
  end


end