# frozen_string_literal: true

class ExhibitController < ApplicationController
  def exhibit
    Item.create!(exhibit_params)
  end

  private
  def exhibit_params
    params.require(:item).permit(:user_id, :name, :price)
  end
end
