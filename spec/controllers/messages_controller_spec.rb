# encoding: utf-8
require 'spec_helper'

describe MessagesController do
  let(:empty_message) { build :message }
  let(:bad_message) { build :bad_message }
  let(:good_message) { build :good_message }


  describe "POST create" do
    context "create message without real sending" do
      before(:each) do
        #Inject the pusher for call not real API for test
        #the same procudure we need when we do not need to call remote API in test.
        controller.pusher = FakePusher.new
      end
      it "create message with empty params"  do
        post :create, {message: empty_message.as_json }
        #post :create, {pub0: empty_message.pub0, page: empty_message.page,uid: empty_message.uid }
        response.should be_success
        expect(response.body).to be_blank
      end
      it "create message with valid params"  do
        post :create, {message: good_message.as_json }

        response.should be_success
        expect(response.body).to be_blank
      end
    end
    context "create message with real sending" do
      before(:each) do
        WebMock.allow_net_connect!
        controller.pusher = Pusher.new
      end
      it "create message with invalid params"  do
        post :create, {message: bad_message.as_json }

        response.should be_success
        expect(controller.code).to eq 400
      end

      it "create message with valid params"  do
        post :create, {message: good_message.as_json }

        response.should be_success
        expect(controller.code).to eq 200
      end
    end
    context "send_sponsor_pay_message correct" do
      it "request must be succes" do
        serialized_message = MessageSerializer.new good_message
        stub_request(:get,Message::URL)
        controller.pusher.send_message_to_sponsor_pay(serialized_message)
        a_request(:get,Message::URL).should have_been_made
      end
    end

    context "send_sponsor_pay_message raise exception",:meeting=>:pusher do
      it "request must raise exception" do
        serialized_message = MessageSerializer.new empty_message
        stub = stub_request(:get,Message::URL).to_raise(RestClient::Exception)
        controller.pusher.send_message_to_sponsor_pay(serialized_message)
        a_request(:get,Message::URL).should have_been_made
      end
    end
  end
end