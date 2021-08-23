require 'rails_helper'

RSpec.describe OrderMailing, type: :model do
  before do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    image1 = FactoryBot.create(:image, user_id: user2.id)
    image2 = FactoryBot.create(:image, user_id: user2.id)
    image3 = FactoryBot.create(:image, user_id: user2.id)
    image4 = FactoryBot.create(:image, user_id: user2.id)
    image5 = FactoryBot.create(:image, user_id: user2.id)
    image6 = FactoryBot.create(:image, user_id: user2.id)
    image7 = FactoryBot.create(:image, user_id: user2.id)
    image8 = FactoryBot.create(:image, user_id: user2.id)
    image9 = FactoryBot.create(:image, user_id: user2.id)
    image10 = FactoryBot.create(:image, user_id: user2.id)
    image11 = FactoryBot.create(:image, user_id: user2.id)
    image12 = FactoryBot.create(:image, user_id: user2.id)
    calendar = FactoryBot.create(:calendar,
      img1: image1.id, img2: image2.id, img3: image3.id, img4: image4.id, 
      img5: image5.id, img6: image6.id, img7: image7.id, img8: image8.id,
      img9: image9.id, img10: image10.id, img11: image11.id, img12: image12.id
    )
    @order_mailing = FactoryBot.build(:order_mailing, user_id: user.id, calendar_id: calendar.id)
    sleep(1)
  end

  #bundle exec rspec spec/models/order_mailing_spec.rb

  describe 'カレンダー購入機能' do
    context 'カレンダーを購入できるとき' do
      it '必要な情報がある時購入できる' do
        expect(@order_mailing).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order_mailing.building = " "
        expect(@order_mailing).to be_valid
      end
    end
    context 'カレンダーを購入できないとき' do
      it '郵便番号がないと購入できない' do
        @order_mailing.postal_code = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Postal codeを入力してください")
      end
      it '郵便番号は半角でないと購入できない' do
        @order_mailing.postal_code = "１２３-４５６７"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it '郵便番号は数字以外（文字）だと購入できない' do
        @order_mailing.postal_code = "ｱｲｳ-ｴｵｶｷ"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it '郵便番号の最初は3桁の数字でないと購入できない' do
        @order_mailing.postal_code = "1234-5678"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it '郵便番号はハイフンがないと購入ができない' do
        @order_mailing.postal_code = "1234567"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it '郵便番号の最後は4桁の数字でないと購入できない' do
        @order_mailing.postal_code = "123-456"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it '都道府県を選択しないと購入できない' do
        @order_mailing.prefecture_id = 1
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Prefectureを選択してください")
      end
      it '市区町村がないと購入できない' do
        @order_mailing.city = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Cityを入力してください")
      end
      it '番地がないと購入できない' do
        @order_mailing.address = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Addressを入力してください")
      end
      it '電話番号がないと購入できない' do
        @order_mailing.tel = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Telを入力してください")
      end
      it '電話番号が全角数字だと購入できない' do
        @order_mailing.tel = "０１２３４５６７８９"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Telは不正な値です")
      end
      it '電話番号が数字でない（文字）だと購入できない' do
        @order_mailing.tel = "abcdefghij"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Telは不正な値です")
      end
      it '電話番号は英数混合だと購入できない' do
        @order_mailing.tel = "abcde12345"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Telは不正な値です")
      end
      it '電話番号ハイフンがあると購入できない' do
        @order_mailing.tel = "012-345-6789"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Telは不正な値です")
      end
      it '電話番号は9桁以下だと購入できない' do
        @order_mailing.tel = "012345678"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Telは不正な値です")
      end
      it '電話番号は12桁以上だと購入できない' do
        @order_mailing.tel = "012345678901"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Telは不正な値です")
      end
      it 'token（カード情報）がないと購入できない' do
        @order_mailing.token = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Tokenを入力してください")
      end
      it 'user_idが空だと購入できない' do
        @order_mailing.user_id = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Userを入力してください")
      end
      it 'calendar_idが空だと購入できない' do
        @order_mailing.calendar_id = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Calendarを入力してください")
      end
    end
  end
end

