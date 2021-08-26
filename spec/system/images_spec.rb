require 'rails_helper'

# bundle exec rspec spec/system/images_spec.rb

RSpec.describe "イラスト投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @image_tag = FactoryBot.build(:image_tag, user_id: @user.id)
    sleep(1)
  end
  it 'イラスト投稿ができるとき' do
    #ログインする
    sign_in(@user)
    #トップページページにいることを確認する
    expect(current_path).to eq(root_path)
    #イラスト投稿ボタンがあることを確認する
    expect(page).to have_content("投稿する")
    #イラスト投稿ボタンを押すと、イラスト投稿ページに移動する
    click_on "icon-post"
    #イラスト投稿フォームを記入する
    picture_path = Rails.root.join('public/images/test_image.png')
    attach_file('image_tag[picture]', picture_path, make_visible: true)
    fill_in "投稿者コメント", with: @image_tag.comment
    select "1月",from: 'image_tag[season_id]'
    fill_in "タグ", with: @image_tag.name
    #投稿ボタンを押すとイメージモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change{Image.count}.by(1)
    #トップページに遷移したことを確認する
    expect(current_path).to eq(root_path)
    #投稿したイラストがブラウザに表示されていることを確認する
    expect(page).to have_selector("img[src$='test_image.png']")
  end
  it 'イラストが投稿できないとき' do
    #ログインする
    sign_in(@user)
    #トップページページにいることを確認する
    expect(current_path).to eq(root_path)
    #イラスト投稿ボタンがあることを確認する
    expect(page).to have_content("投稿する")
    #イラスト投稿ボタンを押すと、イラスト投稿ページに移動する
    click_on "icon-post"
    #イラスト投稿フォームを記入する（イラスト未選択）
    fill_in "投稿者コメント", with: @image_tag.comment
    select "1月",from: 'image_tag[season_id]'
    fill_in "タグ", with: @image_tag.name
    #投稿ボタンを押すとイメージモデルのカウントが変わらないことを確認する
    expect{
      find('input[name="commit"]').click
    }.to change{Image.count}.by(0)
    #イラスト投稿ページにいることを確認する
    expect(current_path).to eq(images_path)
  end
  it '未ログイン時はイラスト投稿ボタンがないため投稿できない' do
    #トップページページに移動する
    visit root_path
    #イラスト投稿ボタンがあることを確認する
    expect(page).to have_no_content("投稿する")
  end
  it '未ログイン時にイラスト投稿ページにアクセスできない' do
    #トップページページに移動する
    visit root_path
    #イラスト投稿ページに遷移をしようとしたら、ログインページが表示される
    visit new_image_path
    expect(current_path).to eq(new_user_session_path)
  end
end

RSpec.describe "イラスト削除", js: true do
  before do
    @user = FactoryBot.create(:user)
    @image_tag = FactoryBot.build(:image_tag, user_id: @user.id)
    sleep(1)
  end
  it 'イラスト投稿者はイラスト削除ができる' do
    #ログインする
    sign_in(@user)
    #イラストを投稿する
    post_image(@image_tag)
    #投稿したイラストがブラウザに表示されていることを確認する
    expect(page).to have_selector("img[src$='test_image.png']")
    #画像をクリックしてイラスト詳細ページに遷移する
    click_on "picture"
    #イラスト削除ボタンがあることを確認する
    expect(page).to have_content("イラストを削除")
    #イラスト削除ボタンを押すとイメージモデルのカウントが1下がることを確認する
    expect{
      find_link("イラストを削除").click
    }.to change{Image.count}.by(-1)
    #ホーム画面に遷移したことを確認する
    expect(current_path).to eq(root_path)
    #投稿したイラストがブラウザ上にないことを確認する
    expect(page).to have_no_selector("img[src$='test_image.png']")
  end
  it '投稿者じゃないユーザーはイラスト削除ボタンがない' do
    #ログインする
    sign_in(@user)
    #イラストを投稿する
    post_image(@image_tag)
    #ログアウトする
    Capybara.current_driver = :selenium
    find('.menu').click
    Capybara.use_default_driver
    #他のユーザーがログインする
    another_user = FactoryBot.create(:user)
    sign_in(another_user)
    #投稿したイラストがブラウザに表示されていることを確認する
    expect(page).to have_selector("img[src$='test_image.png']")
    #画像をクリックしてイラスト詳細ページに遷移する
    click_on "picture"
    #イラスト削除ボタンがあることを確認する
    expect(page).to have_no_content("イラストを削除")
  end
  it '未ログイン時はイラスト削除ボタンがない' do
    #ログインする
    sign_in(@user)
    #イラストを投稿する
    post_image(@image_tag)
    #ログアウトする
    Capybara.current_driver = :selenium
    find('.menu').click
    Capybara.use_default_driver
    #ホーム画面に遷移する
    visit root_path
    #投稿したイラストがブラウザに表示されていることを確認する
    expect(page).to have_selector("img[src$='test_image.png']")
    #画像をクリックしてイラスト詳細ページに遷移する
    click_on "picture"
    #イラスト削除ボタンがあることを確認する
    expect(page).to have_no_content("イラストを削除")
  end
end
