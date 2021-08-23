require 'rails_helper'

RSpec.describe ImageCalendar, type: :model do
  before do
    user = FactoryBot.create(:user)
    image1 = FactoryBot.create(:image, user_id: user.id)
    image2 = FactoryBot.create(:image, user_id: user.id)
    image3 = FactoryBot.create(:image, user_id: user.id)
    image4 = FactoryBot.create(:image, user_id: user.id)
    image5 = FactoryBot.create(:image, user_id: user.id)
    image6 = FactoryBot.create(:image, user_id: user.id)
    image7 = FactoryBot.create(:image, user_id: user.id)
    image8 = FactoryBot.create(:image, user_id: user.id)
    image9 = FactoryBot.create(:image, user_id: user.id)
    image10 = FactoryBot.create(:image, user_id: user.id)
    image11 = FactoryBot.create(:image, user_id: user.id)
    image12 = FactoryBot.create(:image, user_id: user.id)
    calendar = FactoryBot.create(:calendar,
      img1: image1.id, img2: image2.id, img3: image3.id, img4: image4.id, 
      img5: image5.id, img6: image6.id, img7: image7.id, img8: image8.id,
      img9: image9.id, img10: image10.id, img11: image11.id, img12: image12.id
    )
    @image_calendar = FactoryBot.build(:image_calendar)
    sleep(1)
  end

  describe 'カレンダー作成データ' do
    context 'カレンダーのデータが保存できるとき' do
      it 'imageとcalendarが結びついているとき' do
        expect(@image_calendar).to be_valid
      end
    end
    context 'カレンダーのデータが保存できないとき' do
      it 'imageと結びついていないとき' do

        @image_calendar.image = nil
        @image_calendar.valid?
        expect(@image_calendar.errors.full_messages).to include("Imageを入力してください")
      end
      it 'calendarが結びついていないとき' do
        @image_calendar.calendar = nil
        @image_calendar.valid?
        expect(@image_calendar.errors.full_messages).to include("Calendarを入力してください")
      end
    end
  end
end
