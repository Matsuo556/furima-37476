class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase_record_id

  with_options presence: true do
    validates :postal_code,         format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,       numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number,         numericality: { only_integer: true, message: 'is invalid. Input half-width number.' }, length: { minimum: 10, maximum:11, message: 'does not fit in setting count.' }
    validates :item_id
    validates :user_id
    validates :purchase_id
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefeture_id: prefecture_id, city: city, addressj: address, building: building, phone_number: phone_number, purchase_record_id: purchase_record_id)
  end

end