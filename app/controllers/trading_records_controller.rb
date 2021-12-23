class TradingRecordsController < ApplicationController

  def index
    @item = Item.new(item_params)
  end

end
