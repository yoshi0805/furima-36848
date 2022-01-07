class TradingRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :prevent_url, only: [:index]

  def index
    @trading_record_shipping_address = TradingRecordShippingAddress.new
  end

  def create
    @trading_record_shipping_address = TradingRecordShippingAddress.new(trading_record_params)
    if @trading_record_shipping_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: trading_record_params[:token],
        currency: 'jpy'
      )
      @trading_record_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def trading_record_params
    params.require(:trading_record_shipping_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    redirect_to root_path if @item.user_id == current_user.id || !@item.trading_record.nil?
  end
end
