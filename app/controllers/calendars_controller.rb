class CalendarsController < ApplicationController
  def new
    @images = current_cart.images
    @calendar = Calendar.new
  end

  def create
    sleep(1)
    @images = current_cart.images
    @calendar = Calendar.new(calendar_params)
    if @calendar.valid?
      @calendar.save
      ImageCalendar.save(@calendar, @images)
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def calendar_params
    params.require(:calendar).permit(
      :month1_id, :img1, :month2_id, :img2, :month3_id, :img3, :month4_id, :img4,
      :month5_id, :img5, :month6_id, :img6, :month7_id, :img7, :month8_id, :img8,
      :month9_id, :img9, :month10_id, :img10, :month11_id, :img11, :month12_id, :img12
    )
  end
end
