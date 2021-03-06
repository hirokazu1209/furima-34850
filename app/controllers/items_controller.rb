class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update] 
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_same_user, only: [:edit, :update, :destroy]
  before_action :sell, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_same_user
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def sell
    if @item.order.present?
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :shipping_fee_burden_id, :shipment_source_id, :day_to_ship_id).merge(user_id: current_user.id)
  end
end
