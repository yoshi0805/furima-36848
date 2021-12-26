class TradingRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @trading_record_address = TradingRecordShippingAddress.new
  end

end
