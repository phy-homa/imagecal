class CartsController < ApplicationController
  before_action :set_line_item, only: [:add_item, :destroy, :delete_item]
  before_action :set_user
  before_action :set_cart

  def show
    @line_items = @cart.line_items
  end

  def add_item
    @line_item = @cart.line_items.build(image_id: params[:image_id])if @line_item.blank?
    if @line_item.save
      redirect_to current_cart
    else
      redirect_to controller: "images#show"
    end
  end

  def destroy
    @cart.destroy
    redirect_to root_path
  end

  private
  def set_user
    @user = current_user
  end

  def set_line_item
    @line_item = current_cart.line_items.find_by(image_id: params[:image_id])
  end
  
  def set_cart
    @cart = current_cart
  end

end