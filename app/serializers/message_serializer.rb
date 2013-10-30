require 'digest/sha1'
require "addressable/uri"

#The task is simply and serializer is not needed for that, but I think is very useful decision in the future if something
#will be changed you should easily create API for another cases .
class MessageSerializer < ActiveModel::Serializer
  self.root = false
  def attributes
    hash = super
    hash["appid"] = Message::APP_ID
    hash["device_id"] = Message::DEVICE_ID
    hash["ip"] = Message::IP
    hash["locale"] = Message::LOCALE
    hash["page"] = object.page
    hash["ps_time"] = Message::PS_TIME
    hash["pub0"] = object.pub0
    hash["timestamp"] = DateTime.now.to_i
    hash["uid"] = object.uid
    hash["format"] = Message::FORMAT
    hash["offer_types"] = Message::OFFER_TYPES
    hash["hashkey"]  = get_sponsor_pay_hash hash
    hash
  end

  def get_sponsor_pay_hash(hash)
    uri = Addressable::URI.new
    uri.query_values = hash
    query = uri.query
    query.concat ("&#{Message::API_KEY}")
    Digest::SHA1.hexdigest query
  end
end