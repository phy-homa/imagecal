class ImagesController < ApplicationController

  def index
    @images = Image.includes(:user).order(created_at: :desc)
  end
  def new
    @image = ImagesTag.new
  end

  def create
    @image = ImagesTag.new(image_params)
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
    params.require(:images_tag).permit(:comment, :picture, :name).merge(user_id: current_user.id)
  end
end
