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
    validates :category_id,         numericality: { other_than: 1, message: "can't be blank"} 
    validates :shipping_fee_id,     numericality: { other_than: 1, message: "can't be blank"} 
    validates :prefecture_id,       numericality: { other_than: 1, message: "can't be blank"} 
    validates :shipping_time_id,    numericality: { other_than: 1, message: "can't be blank"} 
    validates :price,               numericality: { only_integer: true, message:'is invalid. Input half-width number.'  in: 300..9999999 } 
    validates :user
  end

end
