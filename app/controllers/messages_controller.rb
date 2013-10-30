class MessagesController < ApplicationController

  def new
    @message = Message.new
  end
  attr_accessor :pusher,:code

  def pusher
    @pusher || Pusher.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      serialized_message = ::MessageSerializer.new @message
      #For High Cohesion and Low coupling when we testing applicaiton in spec
      # I moved code with calling remote services to specific klass Pusher
      sponsor_pay_response = pusher.send_message_to_sponsor_pay serialized_message.as_json
      if sponsor_pay_response
        @result = JSON.parse sponsor_pay_response
        @result_message = @result['message']
        @code = sponsor_pay_response.code
        if @result['offers']
          @offers = @result['offers']
        end
      end
      render "messages/message_recieved"
    else
      flash[:error] = "You should fill every fields"
      render :action => 'new'
    end
  end
end
