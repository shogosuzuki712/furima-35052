class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @buy_history = BuyHistory.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @buy_history = BuyHistory.new(history_params)
    if @buy_history.valid?
       pay_item
       @buy_history.save
       redirect_to root_path
    else
       render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def history_params 
    params.require(:buy_history).permit(:postcode, :prefecture_id, :city, :block, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card:   history_params[:token],
      currency: 'jpy'
    )
  end
end
 