class ImagesController < ApplicationController

  def index
    @images = Image.includes(:user)
  end
  def new
    @image = Image.new
    @user = User.find(params[:id])
  end

  def create
    @image = Image.create(image_params)
    if @image.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def image_params
    params.require(:image).permit(:comment, :picture).merge(user_id: current_user.id)
  end
end
