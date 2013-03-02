class MembersController < ApplicationController


  def index
    @susu = Susu.find(params[:susu_id])
    @members = @susu.members
  end

  def new
    @member = Member.new
    @susu = Susu.find(params[:susu_id])
    @form_title = "+ New member"
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
    @banker = @authenticated_user
    @member = Member.find(params[:id])
    @susus = @authenticated_user.susus
    @susu = Susu.find(params[:susu_id])
    @form_title = "Viewing #{@member.first_name}'s info"
  end

  def edit
    @member = Member.find(params[:id])
    @susu = Susu.find(params[:susu_id])
    @form_title = "edit Member info"
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

  def randomize
    # get susu
    @susu = Susu.find(params[:susu_id])
    # get all members of the susu
    group = @susu.members
    raise params.inspect
    # put into an array
    # shuffle
    # loop thru array to display
  end


end
