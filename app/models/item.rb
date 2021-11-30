class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
  validates :item_name
  validates :detail
  validates :category_id
  validates :status_id
  validates :shipping_burden_id
  validates :prefecture_id
  validates :delivery_day_id
  validates :image
  validates :price,inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  validates :price, numericality: true 
  
end
