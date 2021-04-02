require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'aiu123'
        @user.password_confirmation = 'aiu123'
        expect(@user).to be_valid
      end

      it 'すべての情報が正しければ登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do

      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'メールアドレスが一意性制約であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it 'メールアドレスは、@を含む必要があること' do 
        @user.email = 'aiueoaiueo'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user.password = 'aiu123'
        @user.password_confirmation = 'aiu1234'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'パスワードは、半角英字のみでは登録できないこと' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it 'パスワードは、半角数字のみでは入力が登録できないこと' do
        @user.password = '1111111'
        @user.password_confirmation = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it '全角では登録できないこと' do
        @user.password = 'ａａａ１１１１'
        @user.password_confirmation = 'ａａａ１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it 'ユーザー本名は、名字が必須であること' do
        @user.last_name = ''
        @user.first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank", "Last name is invalid"
      end

      it 'ユーザー本名は、名前が必須であること' do
        @user.last_name = '木下'
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank", "First name is invalid"
      end

      it 'ユーザー本名のフリガナは、名字が必須であること' do
        @user.last_name_kana = ''
        @user.first_name_kana = 'ハナコ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank", "Last name kana is invalid"
      end

      it 'ユーザー本名のフリガナは、名前が必須であること' do
        @user.last_name_kana = 'ツツミシタ'
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank", "First name kana is invalid"
      end

      it 'ユーザー本名の名字は、カタカナ意外の全角文字だと登録できないこと' do
        @user.last_name_kana = 'あ亜ａ１'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end

      it 'ユーザー本名の名字は、半角文字だと登録できないこと' do
        @user.last_name_kana = 'a1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end

      it 'ユーザー本名の名前は、カタカナ意外の全角文字だと登録できないこと' do
        @user.first_name_kana = 'aあ亜１'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end

      it 'ユーザー本名の名前は、半角文字だと登録できないこと' do
        @user.first_name_kana = 'a1'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end

      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること'do
      @user.last_name = 'aaa'
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid", "First name is invalid"
      end
    end
  end
end
