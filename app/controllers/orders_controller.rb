class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create] 
  before_action :find_params, only: [:index, :create]
  before_action :set_same_user, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_params
    @item = Item.find(params[:item_id])
  end

  def set_same_user
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :shipment_source_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)   
  end

end