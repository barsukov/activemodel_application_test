#We do not need to use DB and I use only lightweight klass without carrying about names or another cases...
class Message
  #Of course for best practise ,
  #this constant should be relocate to Settings gem(or the same) ,but this application too small and it is not important
  APP_ID = '157'
  FORMAT = 'json'
  DEVICE_ID = "2b6f0cc904d137be2e1730235f5664094b831186"
  LOCALE = "de"
  IP = "109.235.143.113"
  OFFER_TYPES = '112'
  TIME_STAMP = '1312471066'
  PS_TIME = '1312211903'
  API_KEY= "b07a12df7d52e6c118e5d47d3f9e60135b109a1f"
  URL = 'http://api.sponsorpay.com/feed/v1/offers.json'

  include ActiveModel::Dirty
  include ActiveModel::Serialization
  include ActiveModel::Validations
  include ActiveModel::Callbacks
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :page, :pub0, :uid

  validates_presence_of :page,:pub0,:uid

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
