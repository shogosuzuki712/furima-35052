require 'rails_helper'

RSpec.describe BuyHistory, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_history = FactoryBot.build(
      :buy_history, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '住所情報' do
    context '住所情報が登録できるとき' do
      it '全ての情報が正しく入力されていたら登録できる' do
        expect(@buy_history).to be_valid
      end

      it '建物名は入力されていなくても登録できる' do
        @buy_history.building_name = ''
        expect(@buy_history).to be_valid
      end
    end

    context '住所情報が登録できないとき' do
      it 'tokenが空では登録できない' do
        @buy_history.token = ''
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Token can't be blank"
      end

      it '郵便番号が空だと登録できない' do
        @buy_history.postcode = ''
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Postcode can't be blank"
      end

      it '郵便番号にハイフンが入力されてないと登録できない' do
        @buy_history.postcode = '0000000'
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Postcode is invalid"
      end

      it '都道府県が選択されていないと登録できない' do
        @buy_history.prefecture_id = 1
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it '市区町村が空だと登録できない' do
        @buy_history.city = ''
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "City can't be blank"
      end

      it '番地が空だと登録できない'do
        @buy_history.block = ''
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Block can't be blank"
      end

      it '電話番号が空だと登録できない' do
        @buy_history.phone_number = ''
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Phone number can't be blank", "Phone number is invalid"
      end

      it '電話番号が10桁未満では登録できない' do
        @buy_history.phone_number = '123456789' #9桁です
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Phone number is invalid"
      end
      
      it '電話番号が11桁を超過していたら登録できない' do
        @buy_history.phone_number = '123456789123' #12桁です
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Phone number is invalid"
      end

      it '電話番号に数字以外の文字が含まれていたら登録できない' do
        @buy_history.phone_number = '123456789aa'
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Phone number is invalid"
      end
    end
  end
end
