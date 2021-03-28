require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品情報' do
    context '出品がうまくいくとき' do
      it 'すべての情報が正しく入力されていれば、登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")        
      end

      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態についての情報が必須であること' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料の負担についての情報が必須であること' do
        @item.shipping_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden must be other than 1")
      end

      it '発送元の地域についての情報が必須であること' do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source must be other than 1")
      end

      it '発送までの日数についての情報が必須であること' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship must be other than 1")
      end

      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '300dollars'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = 'threemillion'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
