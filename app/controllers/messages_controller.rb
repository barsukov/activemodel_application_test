class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      # TODO send message here
      flash[:notice] = "Message sent!"
      serialized_message = ::MessageSerializer.new @message
      send_message_to_sponsor_pay serialized_message.as_json
      redirect_to root_url
    else
      flash[:error] = "Message has not sent"
      render :action => 'new'
    end
  end

  def send_message_to_sponsor_pay(params = {})
    begin
      sponsor_pay_response = RestClient.get Message::URL, :params => params
      sponsor_pay_response
    rescue => e
      e.response
    end
  end
end
