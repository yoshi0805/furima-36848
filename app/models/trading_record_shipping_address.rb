class TradingRecordShippingAddress 
  include ActiveModel::Model
  attr_accessor  :postal_code,:prefecture_id,:municipality,:address,:building_name,:phone_number,:item_id,:user_id,:token

  validates :prefecture_id, numericality: {other_than: 1, message:"can't be blank"}
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number,format: {with: /\A[0-9]{11}\z/ }
    validates :user_id
    validates :item_id
  end

  def save
    trading_record = TradingRecord.create(item_id: item_id, user_id: user_id)
    shipping_address = ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, trading_record_id: trading_record.id)
  end

end