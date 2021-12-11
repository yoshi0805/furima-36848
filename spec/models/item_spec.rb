require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品' do
    context '商品の出品ができる場合' do
      it '必要な項目が入力されていれば商品が出品できる場合' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない場合' do

      it '画像が添付されていなければ出品できない場合' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空では出品できない場合' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it '商品名が41文字以上の場合は出品できない場合' do
        @item.item_name = "あ" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name is too long (maximum is 40 characters)"
      end

      it '商品詳細が空では出品できない場合' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail can't be blank"
      end

      it '商品詳細が1001文字以上では出品できない場合' do
        @item.detail = "あ" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail is too long (maximum is 1000 characters)"
      end

      it 'カテゴリーが選択されていなければ出品できない場合' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category を選択して下さい"
      end

      it 'カテゴリーで（初期値）を選択していれば出品できない場合' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category を選択して下さい"
      end

      it '商品の状態が選択されていなければ出品できない場合' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status を選択して下さい"
      end

      it '商品の状態で（初期値）を選択していれば出品できない場合' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Status を選択して下さい"
      end

      it '配送料負担が選択されていなければ出品できない場合' do
        @item.shipping_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping burden を選択して下さい"
      end

      it '配送料負担で（初期値）を選択していれば出品できない場合' do
        @item.shipping_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping burden を選択して下さい"
      end

      it '発送元が選択されていなければ出品できない場合' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture を選択して下さい"
      end

      it '発送元で（初期値）を選択していれば出品できない場合' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture を選択して下さい"
      end

      it '発送までの日数が選択されていなければ出品できない場合' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day を選択して下さい"
      end

      it '発送までの日数で（初期値）を選択していれば出品できない場合' do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day を選択して下さい"
      end


      it '商品価格が空では出品できない場合' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '商品価格が300円未満では出品できない場合' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end

      it '商品価格が10000000円以上では出品できない場合' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end

      it '商品価格は半角数値でなければ出品できない場合' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
