class OrdersController < ApplicationController
  def new
    @order_mailing = OrderMailing.new
    @cart = Cart.find_by(id: session[:cart_id])


  end

  def create
    @cart = Cart.find_by(id: session[:cart_id])
    @images = @cart.images.ids
    @order_mailing = OrderMailing.new(order_params)
    if @order_mailing.valid?
      pay_item
      @order_mailing.save
      @order = @order_mailing.get_id
      ImageOrder.create_images(@order, @cart.line_items )
      return redirect_to root_path
    else
      render :new
    end
  end
  private
  def order_params
    params.require(:order_mailing).permit(:postal_code, :prefecture_id, :address, :city, :building, :tel).merge(user_id: current_user.id, token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: 1000,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
