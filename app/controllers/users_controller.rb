class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :ordering]

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
    @orders = current_user.orders.includes(:user)
  end
end
@orders