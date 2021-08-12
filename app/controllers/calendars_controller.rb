class CalendarsController < ApplicationController
  def new
    @images = current_cart.images
    @picture1 = @images[0]
    @picture2 = @images[1]
    @picture3 = @images[2]
    
    @calendar = Calendar.new
  end
end
