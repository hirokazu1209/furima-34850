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
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_params
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :shipment_source_id, :city, :house_number, :building_name, :phone_number,:order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])   
  end

  def pay_item
    Payjp.api_key = "sk_test_4b433e2e1eaab92296c43bea"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_same_user
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
end