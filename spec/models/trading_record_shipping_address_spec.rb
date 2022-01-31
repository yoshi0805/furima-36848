require 'rails_helper'

RSpec.describe TradingRecordShippingAddress, type: :model do
  before do
    user = FactoryBot.build_stubbed(:user)
    item = FactoryBot.build_stubbed(:item)
    @order = FactoryBot.build(:trading_record_shipping_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入ができる' do
      it '項目が適切に入力されていれば購入できる' do
        expect(@order).to be_valid
      end

      it '建物名がなくても購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
  end

  context '商品購入ができない' do
    it 'tokenが空では商品購入できない' do
      @order.token = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Token can't be blank"
    end

    it '郵便番号が空では商品購入できない' do
      @order.postal_code = ''
      @order.valid?
      binding.pry
      expect(@order.errors.full_messages).to include "Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)'
    end

    it '郵便番号は半角文字列でなければ商品購入できない' do
      @order.postal_code = '１２３-４５６７'
      @order.valid?
      expect(@order.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
    end

    it '郵便番号は「3桁ハイフン4桁」の文字列でなければ商品購入できない' do
      @order.postal_code = '1234-123'
      @order.valid?
      expect(@order.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
    end

    it '都道府県の選択が（初期値）では商品購入できない' do
      @order.prefecture_id = '1'
      @order.valid?
      expect(@order.errors.full_messages).to include "Prefecture can't be blank"
    end

    it '市区町村が空では商品購入できない' do
      @order.municipality = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Municipality can't be blank"
    end

    it '番地が空では商品購入できない' do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Address can't be blank"
    end

    it '電話番号が空では商品購入できない' do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Phone number can't be blank"
    end

    it '電話番号が10桁未満では商品購入できない' do
      @order.phone_number = '123456789'
      @order.valid?
      expect(@order.errors.full_messages).to include 'Phone number is invalid'
    end

    it '電話番号が12桁以上では商品購入できない' do
      @order.phone_number = '123456789012'
      @order.valid?
      expect(@order.errors.full_messages).to include 'Phone number is invalid'
    end

    it '電話番号は半角数値でなければ商品購入できない' do
      @order.phone_number = '１２３４５６７８９１２'
      @order.valid?
      expect(@order.errors.full_messages).to include 'Phone number is invalid'
    end

    it '電話番号は半角数値のみでなければ商品購入できない' do
      @order.phone_number = '123-4567-8900'
      @order.valid?
      expect(@order.errors.full_messages).to include 'Phone number is invalid'
    end

    it 'userが紐付いていなければ商品購入できない' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include "User can't be blank"
    end

    it 'itemが紐付いていなければ商品購入できない' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include "Item can't be blank"
    end
  end
end
