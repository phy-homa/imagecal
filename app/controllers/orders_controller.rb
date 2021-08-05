class OrdersController < ApplicationController
  def new
    @order_mailing = OrderMailing.new
    @image = Image.find(params[image_id])
    @cart = Cart.find_by(id: session[:cart_id])
    binding.pry
  end

  def create
    binding.pry
    @order_mailing = OrderMailing.new(order_params)
    @cart = Cart.find_by(id: session[:cart_id])
    if @order_mailing.valid?
      @order.save
      return redirect_to root_path
    else
      render :new
    end
  end
  private
  def order_params
    params.require(:order).permit(:quantity).merge(user_id: current_user.id, image_id: params[:id], cart_id: @cart.id )
  end
end
