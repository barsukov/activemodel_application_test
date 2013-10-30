class Pusher < BasePusher
  def send_message_to_sponsor_pay(params = {})
    begin
      sponsor_pay_response = RestClient.get URL, :params => params
      sponsor_pay_response
    rescue => e
      e.response
    end
  end
end