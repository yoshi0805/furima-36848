require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる場合' do
      it '項目が全て入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'emailには＠が含まれなければ登録できない' do
        @user.email = 'hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end

      it 'passwordは英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'passwordが全角では登録できない' do
        @user.password = 'ＰＰＰ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password","Password には英字と数字の両方を含めて設定してください"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'お名前(全角)の名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'お名前(全角)の名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'お名前(全角)カナの名字の入力が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'お名前(全角)カナの名字の入力が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it 'お名前(全角)の名字の入力は全角(漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'ｱｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name 全角文字を使用してください'
      end

      it 'お名前(全角)の名前の入力は全角(漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'ｱｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name 全角文字を使用してください'
      end

      it 'お名前カナ(全角）の名字は全角（カタカナ）でなければ登録できない' do
        @user.last_name_kana = 'ｱｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana 全角カタカナのみで入力して下さい'
      end

      it 'お名前カナ(全角）の名前は全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = 'ｱｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana 全角カタカナのみで入力して下さい'
      end

      it '生年月日が空では登録ができない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end
