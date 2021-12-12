class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :detail, :category_id, :status_id, :shipping_burden_id, :prefecture_id,
                                 :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
