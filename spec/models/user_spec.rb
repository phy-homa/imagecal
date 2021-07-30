require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep(1)
  end
  #bundle exec rspec spec/models/user_spec.rb

  describe 'ユーザー登録' do
    context 'ユーザー登録できる時' do
      it '必要項目を全て入力した時に登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上ある場合、登録できる' do
        @user.password = "abcd1234"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録できない時' do
      it 'nicknameが空の場合、登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'firstnameが空の場合、登録できない' do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'lastnameが空の場合、登録できない' do
        @user.lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'emailが空の場合、登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複している場合、登録できない' do
        
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに＠がない場合、登録できない' do
        @user.email = "testtestcom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空の場合、登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下の時登録できない' do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '確認用passwordが空の場合、登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordと確認用passwordが異なる場合は、登録できない' do
        @user.password = "abc123"
        @user.password_confirmation = "123abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end


