class MembersController < ApplicationController

  def index
    @susu = Susu.find(params[:susu_id])
    @members = Member.all
    # binding.pry
      # redirect_to susu_members_path(@susu)
  end

  def new
    @member = Member.new
    @susu = Susu.find(params[:susu_id])
  end

  def create
    @susu = Susu.find(params[:susu_id])
    @member = Member.new(params[:member])
      if @member.save
        redirect_to susu_member_path(@susu, @member), notice: "New member added."
      else
        flash[:notice] = "Something went wrong."
        render 'new'
      end
  end

  def show
    @member = Member.find(params[:id])
    @susu = Susu.find(params[:susu_id])
    @susus = @authenticated_user.susus
  end

  def edit
    @member = Member.find(params[:id])
    @susu = Susu.find(params[:susu_id])
  end

  def update
    @susu = Susu.find(params[:susu_id])
    @member = Member.find(params[:id])
    @member.update_attributes(params[:member])
      redirect_to susu_members_path(@susu), notice: "Member updated."
  end

  def destroy
    @susu = Susu.find(params[:susu_id])
    @member = Member.find(params[:id]).destroy
      redirect_to susu_members_path(@susu), notice: "Member deleted"
  end


end
