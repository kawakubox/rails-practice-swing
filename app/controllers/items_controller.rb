class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy]

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

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def edit_params
    params.require(:item).permit(:name, :price)
  end
end
