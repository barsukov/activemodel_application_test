class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      # TODO send message here
      serialized_message = ::MessageSerializer.new @message
      sponsor_pay_response = send_message_to_sponsor_pay serialized_message.as_json
      @result = JSON.parse sponsor_pay_response
      @result_message = @result['message']
      @code = sponsor_pay_response.code
      if @result['offers']
        @offers = @result['offers']
      end

      render "messages/message_recieved"
    else
      flash[:error] = "You should fill every fields"
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
