class TradingRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @trading_record_shipping_address = TradingRecordShippingAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    binding.pry
    @trading_record_shipping_address = TradingRecordShippingAddress.new(trading_record_params)
    if @trading_record_shipping_address.valid?
      @trading_record_shipping_address.save
      redirect_to root_path
    else
      render :index
    end

  end

  private
  def trading_record_params
    params.require(:trading_record_shipping_address).permit(:postal_code,:prefecture_id,:municipality,:address,:building_name,:phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
