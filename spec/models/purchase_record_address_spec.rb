require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_address = FactoryBot.build(:purchase_record_address, item_id: item.id, user_id: user.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_record_address.building = ''
        expect(@purchase_record_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_record_address.postal_code = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが3桁ハイフン4桁の半角文字列のみ保存可能なこと' do
        @purchase_record_address.postal_code = '1234567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Postal code is invalid. Input half-width number include hyphen(-)')
      end
      it 'prefecture_idが---だと保存できないこと' do
        @purchase_record_address.prefecture_id = '1'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_record_address.city = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_record_address.address = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_record_address.phone_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが大文字だと保存できないこと' do
        @purchase_record_address.phone_number = '０１２３４５６７８９'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Phone number is invalid. Input half-width number except hyphen(-)')
      end
      it 'phone_numberが10桁未満では保存できないこと' do
        @purchase_record_address.phone_number = '012345678'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Phone number does not fit in setting count.')
      end
      it 'phone_numberが11桁より大きいと保存できないこと' do
        @purchase_record_address.phone_number = '012345678901'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Phone number does not fit in setting count.')
      end
      it 'phone_numberにハイフンがあると保存できないこと' do
        @purchase_record_address.phone_number = '012-456-789'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Phone number is invalid. Input half-width number except hyphen(-)')
      end
      it 'tokenが空では登録できないこと' do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_record_address.user_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_record_address.item_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
