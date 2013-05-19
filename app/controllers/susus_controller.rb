class SususController < ApplicationController

  def index
    @susus = @authenticated_user.susus.order('susus.name desc')
    redirect_to @authenticated_user
  end

  def new
    find_banker
    @susu = Susu.new(params[:susu])
    @form_title = "+ new Susu"
  end

  def create
    @susu = @authenticated_user.susus.new(params[:susu])
    if @susu.save
      redirect_to banker_susu_path(@authenticated_user, @susu), notice: "#{@susu.name} has been created"
    else
      @form_title = "+ new Susu"
      flash.now[:error] = "Your Susu has not been created. Please retry."
      render 'new'
    end
  end

  def show
    find_susu
    @members = @susu.members
    find_banker
  end

  def edit
    find_susu
    find_banker
    @form_title = "Edit susu info"
  end

  def update
    find_susu
    find_banker
    @susu.update_attributes(params[:susu])
      redirect_to banker_susu_path(@banker, @susu), notice: "Susu updated"
  end

  def destroy
    find_banker
    Susu.find(params[:id]).destroy
    flash[:error] = "Susu deleted"
    redirect_to banker_path(@banker)
  end

private
  def stats
  end

  def find_susu
    @susu = Susu.find(params[:id])
  end

  def find_banker
    @banker = @authenticated_user
  end

  # def form_name(name)
  #   @form_title = ""

  # end


end