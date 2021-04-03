class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :title, :text, 
      :category_id, state_id:, :fee_burden_id,
      :prefecture_id, :ship_date_id, :price,
    ).merge(user_id: current_user.id)
  end
end
