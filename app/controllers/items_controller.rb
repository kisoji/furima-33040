class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
   
      @item.update(item_params) if @item.user.id == current_user.id
    return  redirect_to item_path if @item.valid?
    
      render 'edit'
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :delivery_id, :prefecture_id, :preparation_id, :price, :image).merge(user_id: current_user.id)
  end
end
