require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
      sleep 0.2
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it '建物名は空でも登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end

    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'shipment_sourceを選択していないと保存できないこと' do
        @order_address.shipment_source_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipment source can't be blank")
      end
      
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは、数字のみでないと保存出来ないこと' do
        @order_address.phone_number = 'aaaaaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberは、11桁以内でないと保存出来ないこと' do
        @order_address.phone_number = 000000000
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Include hyphen(-)')
      end

      it 'tokenが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと保存できないこと' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
