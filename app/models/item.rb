class Item < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :introduction, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :preparation_day_id, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
