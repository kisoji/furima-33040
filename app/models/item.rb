class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :preparation
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Input half-width numbers.' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999_999,
                            message: 'is out of setting range' }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_id
    validates :prefecture_id
    validates :preparation_id
  end
end
