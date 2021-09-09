class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cart, only: [:new, :create]

  def new
    @order_mailing = OrderMailing.new
  end

  def create
    @images = @cart.images.ids
    @order_mailing = OrderMailing.new(order_params)
    if @order_mailing.valid?
      pay_item
      @order_mailing.save
      @cart.destroy
      return redirect_to root_path
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order_mailing).permit(:postal_code, :prefecture_id, :address, :city, :building, :tel).merge(user_id: current_user.id, token: params[:token], calendar_id: params[:calendar_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: 1100,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def find_cart
    @cart = Cart.find_by(id: session[:cart_id])
  end
end
