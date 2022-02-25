class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_time
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :content
    validates :category_id,         numericality: { other_than: 1, message: "can't be blank" }
    validates :condition_id,        numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_fee_id,     numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id,       numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_time_id,    numericality: { other_than: 1, message: "can't be blank" }
    validates :price,               numericality: { only_integer: true, message: 'is invalid. Input half-width number.' }
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is out of setting range.' }
    validates :image
  end
end
