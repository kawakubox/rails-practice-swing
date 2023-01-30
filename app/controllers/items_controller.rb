class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy, :buy]

  def update
    unless @item.user_id == params[:user_id].to_i
      render status: :forbidden and return
    end

    @item.update!(edit_params)

    render json: @item
  end

  def destroy
    unless @item.user_id == params[:user_id].to_i
      render status: :forbidden and return
    end

    @item.destroy!
  end

  def buy
    buyer = User.find(params[:buyer_id])

    if buyer.user_point.point < @item.price
      render status: :unprocessable_entity and return
    end

    ActiveRecord::Base.transaction do
      Transaction.create!(item: @item, buyer: buyer, item_name: @item.name, item_price: @item.price)
      buyer.user_point.spend(@item.price)
      @item.owner.user_point.gain(@item.price)
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def edit_params
    params.require(:item).permit(:name, :price)
  end
end
