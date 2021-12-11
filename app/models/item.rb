class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to :status
  belongs_to :shipping_burden
  belongs_to :prefecture
  belongs_to :delivery_day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :detail, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1, message: 'を選択して下さい' }
    validates :status_id, numericality: { other_than: 1, message: 'を選択して下さい' }
    validates :shipping_burden_id, numericality: { other_than: 1, message: 'を選択して下さい' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択して下さい' }
    validates :delivery_day_id, numericality: { other_than: 1, message: 'を選択して下さい' }
    validates :image
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  validates :price, numericality: true
end
