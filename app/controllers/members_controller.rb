class MembersController < ApplicationController

  def index
    @members = Member.all
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
  end

  def edit
    @member = Member.find(params[:id])
    @susu = Susu.find(params[:susu_id])
  end



end
