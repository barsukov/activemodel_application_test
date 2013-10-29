require 'digest/sha1'
#The task is simply and serializer is not needed for that, but I think is very useful decision in the future if something
#will be changed you should easily create API for another cases .
class MessageSerializer < ActiveModel::Serializer
  self.root = false
  def attributes
    hash = super
    hash["appid"] = Message::APP_ID
    hash["format"] = Message::FORMAT
    hash["device_id"] = Message::DEVICE_ID
    hash["locale"] = Message::LOCALE
    hash["ip"] = Message::IP
    hash["page"] = object.page
    hash["timestamp"] = DateTime.now.to_i
    hash["ps_time"] = Message::PS_TIME
    hash["pub0"] = object.pub0
    hash["uid"] = object.uid
    hash["offer_types"] = Message::OFFER_TYPES
    hash["hashkey"]  = Digest::SHA1.hexdigest Message::API_KEY
    hash
  end
end