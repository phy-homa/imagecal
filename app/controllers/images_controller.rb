class ImagesController < ApplicationController
  

  def index
    @images = Image.includes(:user).order(created_at: :desc)
    @cart = Cart.find_by(id: session[:cart_id])
  end
  def new
    @image = ImageTag.new
  end

  def create
    @image = ImageTag.new(image_params)
    if @image.valid?
      @image.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private
  def image_params
    params.require(:image_tag).permit(:comment, :picture, :season_id, :name).merge(user_id: current_user.id)
  end
end
