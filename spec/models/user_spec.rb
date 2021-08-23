require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep(1)
  end

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
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it 'firstnameが空の場合、登録できない' do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnameを入力してください")
      end
      it 'lastnameが空の場合、登録できない' do
        @user.lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastnameを入力してください")
      end
      it 'emailが空の場合、登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailが重複している場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailに＠がない場合、登録できない' do
        @user.email = "testtestcom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'iconがないと登録できない' do
        @user.icon = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Iconを入力してください")
      end
      it 'passwordが空の場合、登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下の時登録できない' do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it '確認用passwordが空の場合、登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordと確認用passwordが異なる場合は、登録できない' do
        @user.password = "abc123"
        @user.password_confirmation = "123abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end


