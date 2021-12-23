class ShippingAddress < ApplicationRecord
  belongs_to :trading_record
  belongs_to :prefecture
end
