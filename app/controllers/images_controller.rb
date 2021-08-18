class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

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
      @image.tags_save(@tag_list)
      return redirect_to root_path
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to root_path
  end

  def search
    @images = Tag.search(params[:keyword])
  end

  private
  def image_params
    @tag_list = params[:image_tag][:name].split(",")
    params.require(:image_tag).permit(:comment, :picture, :season_id).merge(user_id: current_user.id)
  end
end
