class CalendarsController < ApplicationController
  def new
    @images = current_cart.images
    @picture1 = @images[0]
    @picture2 = @images[1]
    @picture3 = @images[2]
    @picture4 = @images[3]
    @picture5 = @images[4]
    @picture6 = @images[5]
    @picture7 = @images[6]
    @picture8 = @images[7]
    @picture9 = @images[8]
    @picture10 = @images[9]
    @picture11 = @images[10]
    @picture12 = @images[11]
    @calendar = Calendar.new
  end

  def create
    @images = current_cart.images

    @calendar = Calendar.new(calendar_params)
    @calendar.save
    ImageCalendar.save(@calendar)
  end

  private
  def calendar_params
    @image_id = params[:image_id]
    params.require(:calendar).permit(:month, :image_id)
    
  end
end
