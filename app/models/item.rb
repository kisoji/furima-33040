class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :preparation
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_id
    validates :prefecture_id
    validates :preparation_id
  end
  
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :delivery_id
    validates :prefecture_id
    validates :preparation_id
    validates :price
    validates :image
  end
end
