class CalendarsController < ApplicationController
  before_action :authenticate_user!
  def new
    @images = current_cart.images
    @calendar = Calendar.new
  end

  def create
    @images = current_cart.images
    @calendar = Calendar.new(calendar_params)
    if @calendar.valid?
      @calendar.save
      ImageCalendar.save(@calendar, @images)
      ImageMonth.save(@calendar)
      redirect_to calendar_path(@calendar.id)
    else
      render :new
    end
  end

  def show
    @calendar = Calendar.find(params[:id])
    @image_months = @calendar.image_month.all.order("month ASC")
    @image_month1 = @image_months[0]
    @image_month2 = @image_months[1]
    @image_month3 = @image_months[2]
    @image_month4 = @image_months[3]
    @image_month5 = @image_months[4]
    @image_month6 = @image_months[5]
    @image_month7 = @image_months[6]
    @image_month8 = @image_months[7]
    @image_month9 = @image_months[8]
    @image_month10 = @image_months[9]
    @image_month11 = @image_months[10]
    @image_month12 = @image_months[11]
    @images = @calendar.images
  end

  def show_order

    @order = Order.find(params[:id])
    @image_months = @order.calendar.image_month.all.order("month ASC")
    @image_month1 = @image_months[0]
    @image_month2 = @image_months[1]
    @image_month3 = @image_months[2]
    @image_month4 = @image_months[3]
    @image_month5 = @image_months[4]
    @image_month6 = @image_months[5]
    @image_month7 = @image_months[6]
    @image_month8 = @image_months[7]
    @image_month9 = @image_months[8]
    @image_month10 = @image_months[9]
    @image_month11 = @image_months[10]
    @image_month12 = @image_months[11]
    @images = @order.calendar.images

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
