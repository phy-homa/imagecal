require 'rails_helper'

RSpec.describe Calendar, type: :model do
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
    @calendar = FactoryBot.build(:calendar,
      img1: image1.id, img2: image2.id, img3: image3.id, img4: image4.id, 
      img5: image5.id, img6: image6.id, img7: image7.id, img8: image8.id,
      img9: image9.id, img10: image10.id, img11: image11.id, img12: image12.id
    )
    sleep(1)
  end

  describe 'カレンダー作成機能' do
    context 'カレンダーを作成できるとき' do
      it '全ての項目が入力・選択されている場合、作成できる' do
        expect(@calendar).to be_valid
      end
    end
    context 'カレンダーを作成できないとき' do
      it 'month1_idを選択しないと作成できない' do
        @calendar.month1_id = 1
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Month1を選択してください(Picture1)")
      end
      it 'month2_idを選択しないと作成できない' do
        @calendar.month2_id = 1
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Month2を選択してください(Picture2)")
      end
      it 'month3_idを選択しないと作成できない' do
        @calendar.month3_id = 1
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Month3を選択してください(Picture3)")
      end
      it 'month4_idを選択しないと作成できない' do
        @calendar.month4_id = 1
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Month4を選択してください(Picture4)")
      end
      it 'month5_idを選択しないと作成できない' do
        @calendar.month5_id = 1
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Month5を選択してください(Picture5)")
      end
      it 'month6_idを選択しないと作成できない' do
        @calendar.month6_id = 1
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Month6を選択してください(Picture6)")
      end
      it 'month7_idを選択しないと作成できない' do
        @calendar.month7_id = 1
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Month7を選択してください(Picture7)")
      end
      it 'month8_idを選択しないと作成できない' do
        @calendar.month8_id = 1
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Month8を選択してください(Picture8)")
      end
      it 'month9_idを選択しないと作成できない' do
        @calendar.month9_id = 1
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Month9を選択してください(Picture9)")
      end
      it 'month10_idを選択しないと作成できない' do
        @calendar.month10_id = 1
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Month10を選択してください(Picture10)")
      end
      it 'month11_idを選択しないと作成できない' do
        @calendar.month11_id = 1
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Month11を選択してください(Picture11)")
      end
      it 'month12_idを選択しないと作成できない' do
        @calendar.month12_id = 1
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Month12を選択してください(Picture12)")
      end
    end
  end
end
