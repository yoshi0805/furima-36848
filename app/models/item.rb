class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to :status
  belongs_to :shipping_burden
  belongs_to :prefecture
  belongs_to :delivery_day
  belongs_to :user
  has_one_attached :image
  has_one :trading_record
  has_many :comments

  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :detail, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :status_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :shipping_burden_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :delivery_day_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :image
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
