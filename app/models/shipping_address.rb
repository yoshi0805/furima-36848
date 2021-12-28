class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :trading_record
  belongs_to :prefecture
end
