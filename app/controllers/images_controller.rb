class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :notice]
  before_action :show_monthly, only: :index

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

  def notice

  end

  private
  def image_params
    @tag_list = params[:image_tag][:name].split(",")
    params.require(:image_tag).permit(:comment, :picture, :season_id).merge(user_id: current_user.id)
  end

  def show_monthly
    @images_jan = Image.show_jan
    @images_feb = Image.show_feb
    @images_mar = Image.show_mar
    @images_apr = Image.show_apr
    @images_may = Image.show_may
    @images_jun = Image.show_jun
    @images_jul = Image.show_jul
    @images_aug = Image.show_aug
    @images_sep = Image.show_sep
    @images_oct = Image.show_oct
    @images_nov = Image.show_nov
    @images_dec = Image.show_dec
    @images_spr = Image.show_spr
    @images_sum = Image.show_sum
    @images_aut = Image.show_aut
    @images_win = Image.show_win
    @images_all = Image.show_all
    @images_etc = Image.show_etc
  end
end
