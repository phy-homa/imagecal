class LineItemsController < ApplicationController
  before_action :authenticate_user!, only: :destroy

  def destroy
    @line_items = current_cart.line_items
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    if @line_items.empty? 
      redirect_to root_path
      current_cart.destroy
    else
      redirect_to current_cart
    end
  end
end
