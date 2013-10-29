class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      # TODO send message here
      flash[:notice] = "Message sent!"
      redirect_to root_url
    else
      flash[:error] = "Message has not sent"
      render :action => 'new'
    end
  end
end
