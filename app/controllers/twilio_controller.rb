class TwilioController < ApplicationController

  def new
  end

  def create
    from_phone = "+15162791831"
    to_phone = params[:phone]
    txt = params[:text_message]


    client = Twilio::REST::Client.new(TW_SID, TW_TOK)
    @text_message = client.account.sms.messages.create({:from => from_phone, :to =>
    to_phone, :body => txt})


    # redirect_to :controller => "susus", :action => "show"
    redirect_to :back
  end

end