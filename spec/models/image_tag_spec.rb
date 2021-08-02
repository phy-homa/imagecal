require 'rails_helper'

RSpec.describe ImageTag, type: :model do
  before do
    user = FactoryBot.create(:user)
    @image_tag = FactoryBot.build(:image_tag, user_id: user.id)
  end
  #bundle exec rspec spec/models/image_tag_spec.rb

  describe 'イラスト投稿機能' do
    context 'イラスト投稿できる時' do
      it '全ての項目が入力・選択されている場合、投稿できる' do
        expect(@image_tag).to be_valid
      end
      it 'コメントがない場合でも、投稿できる' do
        @image_tag.comment = ""
        expect(@image_tag).to be_valid
      end
      it 'タグがない場合でも、投稿できる' do
        @image_tag.name = ""
        expect(@image_tag).to be_valid
      end
    end
    context 'イラスト投稿できない時' do
      it 'イラストがない場合、投稿できない' do
        @image_tag.picture = ""
        @image_tag.valid?
        expect(@image_tag.errors.full_messages).to include("Picture can't be blank")
      end
      it 'seasonを選択していない場合、投稿できない' do
        @image_tag.season_id = 1
        @image_tag.valid?
        expect(@image_tag.errors.full_messages).to include("Season can't be blank")
      end
      it 'ユーザーと紐づいていないと投稿できない' do
        @image_tag.user_id = ""
        @image_tag.valid?
        expect(@image_tag.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
