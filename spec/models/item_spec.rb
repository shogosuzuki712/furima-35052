require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できるとき' do
      it '全ての情報が入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    
    context '商品登録できないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が必須であること' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it '商品の説明が必須であること' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end 
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it '商品の状態についての情報が必須であること' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "State must be other than 1"
      end
      it '配送料の負担についての情報が必須であること' do
        @item.fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee burden must be other than 1"
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it '発送までの日数についての情報が必須であること' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship date must be other than 1"
      end
      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank", "Price is not a number", "Price is invalid"
      end
      it '販売価格は、¥300未満では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it '販売価格は、¥9999999超過では保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it '販売価格は全角数字では保存できない' do
        @item.price = '４４４'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '販売価格は全角文字では保存できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      
      it '販売価格は全角英数字混合では保存できない' do
        @item.price = '４４４あ'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '販売価格は半角英字のみでは保存できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it '販売価格は半角英字を含んでいると保存できない' do
        @item.price = '444a'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
