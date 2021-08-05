class OrdersController < ApplicationController
  def new
    @order_mailing = OrderMailing.new
    @cart = Cart.find_by(id: session[:cart_id])
    @line_items = @cart.line_items

  end

  def create
    @order_mailing = OrderMailing.new(order_params)
    @cart = Cart.find_by(id: session[:cart_id])
    if @order_mailing.valid?
      @order_mailing.save
      return redirect_to root_path
    else
      binding.pry
      render :new
    end
  end
  private
  def order_params
    params.require(:order_mailing).permit(:postal_code, :prefecture_id, :city, :building, :tel).merge(user_id: current_user.id )

  end
end
