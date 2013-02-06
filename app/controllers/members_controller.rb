class MembersController < ApplicationController

  def index
    @susu = Susu.find(params[:susu_id])
    @members = @susu.members
  end

  def new
    @member = Member.new
    @susu = Susu.find(params[:susu_id])
  end

  def create
    @susu = Susu.find(params[:susu_id])
    @member = @susu.members.new(params[:member])
      if @member.save
        redirect_to banker_susu_path(@authenticated_user, @susu), notice: "New member added."
      else
        render 'new', alert: "Something went wrong."
      end
  end

  def show
    @member = Member.find(params[:id])
    @susus = @authenticated_user.susus
    @susu = Susu.find(params[:susu_id])
  end

  def edit
    @member = Member.find(params[:id])
    @susu = Susu.find(params[:susu_id])
  end

  def update
    @susu = Susu.find(params[:susu_id])
    @member = Member.find(params[:id])
    @member.update_attributes(params[:member])
      redirect_to banker_susu_path(@authenticated_user, @susu), notice: "Member updated."
  end

  def destroy
    @susu = Susu.find(params[:susu_id])
    @member = Member.find(params[:id]).destroy
      redirect_to banker_susu_path(@authenticated_user, @susu), notice: "Member deleted."
  end


end
