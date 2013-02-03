class SususController < ApplicationController

  def index
    # @susus = Susu.all
    @susus = @authenticated_user.susus.all
    redirect_to @authenticated_user
  end

  def new
    @banker = Banker.find(params[:banker_id])
    # @susu = @authenticated_user.susus.new
    @susu = Susu.new
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
    # @member = Member.find(params[:id])
    @susu = Susu.find(params[:id])
    @banker = @authenticated_user
  end

  def edit
    # @member = Member.find(params[:id])
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
      redirect_to banker_path(@banker), notice: "susu deleted"
  end


end