require 'rails_helper'

RSpec.describe "新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

# bundle exec rspec spec/system/users_spec.rb

  context '新規登録できる時' do
    it 'メールアドレス入力を選択し、必要項目を入力と、新規登録できる' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録ボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 認証方法選択ページへ遷移する
      visit new_user_path
      # 認証を利用しないを選択し、新規登録ページに遷移する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム', with: @user.nickname
      fill_in '名字', with: @user.firstname
      fill_in '名前', with: @user.lastname
      fill_in 'Eメール', with: @user.email
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('user[icon]', image_path, make_visible: true)
      fill_in 'パスワード', with: @user.password
      fill_in '確認用パスワード', with: @user.password
      # 登録ボタンを押す
      expect{
        find('input[name="commit"]').click
      }.to change{User.count}.by(1)
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path 
      # ユーザー名、カーソルを合わせるとログアウトボタンが表示されることを確認する
      expect(page).to have_content(@user.nickname)
      find('.menu').click
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
    it 'google認証を用いて、必要項目を入力すると、新規登録できる' do
      # トップページに移動する
      # トップページに新規登録ボタンがあることを確認する
      # 認証方法選択ページへ遷移する
      # google認証を選択し、新規登録ページに遷移する
      # ユーザー情報を入力する
      # 登録ボタンを押す
      # トップページへ遷移することを確認する
      # カーソルを合わせるとログアウトボタンとユーザー名が表示されることを確認する
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
    end
    it 'facebook認証を用いて、必要項目を入力すると、新規登録ができない' do
      # トップページに移動する
      # トップページに新規登録ボタンがあることを確認する
      # 認証方法選択ページへ遷移する
      # facebook認証を選択し、新規登録ページに遷移する
      # ユーザー情報を入力する
      # 登録ボタンを押す
      # トップページへ遷移することを確認する
      # カーソルを合わせるとログアウトボタンとユーザー名が表示されることを確認する
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
    end
  end
  context '新規登録できない時' do
    it '入力内容にミスがあると、新規登録ができない' do
      #トップページに移動する
      visit root_path
      # トップページに新規登録ボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 認証方法選択ページへ遷移する
      visit new_user_path
      # 認証を利用しないを選択し、新規登録ページに遷移する
      visit new_user_registration_path
      # ユーザー情報を入力する(nickname未入力)
      fill_in '名字', with: @user.firstname
      fill_in '名前', with: @user.lastname
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in '確認用パスワード', with: @user.password
      # 登録ボタンを押す
      expect{
        find('input[name="commit"]').click
      }.to change{User.count}.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインできる時' do
    it '保存されているユーザー情報と一致すれば、ログインできる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      # ユーザー名、カーソルを合わせるとログアウトボタンが表示されることを確認する
      expect(page).to have_content(@user.nickname)
      find('.menu').click
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインできない時' do
    it '保存されているユーザー情報と一致しないと、ログインできない' do
      #トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する(Email不一致)
      fill_in 'Eメール', with: "123123213@test.com"
      fill_in 'パスワード', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq user_session_path
    end
  end
end

RSpec.describe "ログアウト時", js: true do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログアウトするとき' do
    it 'ログアウトが正常にできた時' do
      #ログインをする
      sign_in(@user)
      #サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      #メニューを押すとログアウトボタンがあることを確認する
      Capybara.current_driver = :selenium
      find('.menu').click
      expect(page).to have_content("ログアウト")
      #ログアウトボタンをクリックする
      click_on "ログアウト"
      ##サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていることを確認する
      expect(page).to have_content('新規登録')
      expect(page).to have_content('ログイン')
      Capybara.use_default_driver
    end
  end
end
