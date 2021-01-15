class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  def index
    @item = Item.find(params[:item_id])
    return redirect_to root_path if @item.user.id == current_user.id || @item.order != nil
    @order = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @order = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end
  
  private

  def order_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
