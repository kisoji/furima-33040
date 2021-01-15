class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  # before_action :sold_out_item, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    return redirect_to root_path if @item.user.id == current_user.id || !@item.order.nil?

    @user_order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  # def sold_out_item
  #   redirect_to root_path if @item.user.id == current_user.id || @item.order != nil
  # end
end
