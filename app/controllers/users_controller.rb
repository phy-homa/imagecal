class UsersController < ApplicationController
  before_action :authenticate_user!, only: :setting

  def new

  end

  def show
    @user = User.find(params[:id])
    @images = @user.images.all
  end

  def index
    @user = current_user
  end

  def ordering
    @orders = Order.includes(:user)
    
    
  end
end
@orders