require 'rails_helper'

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
    abother_image_tag = FactoryBot
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
    click_on "ログアウト"
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
    click_on "ログアウト"
    #ホーム画面に遷移する
    visit root_path
    #投稿したイラストがブラウザに表示されていることを確認する
    expect(page).to have_selector("img[src$='test_image.png']")
    #画像をクリックしてイラスト詳細ページに遷移する
    click_on "picture"
    #イラスト削除ボタンがあることを確認する
    expect(page).to have_no_content("イラストを削除")
    Capybara.use_default_driver
  end
end
RSpec.describe "カート追加", js: true do
  before do
    @user = FactoryBot.create(:user)
    @image_tag = FactoryBot.build(:image_tag, user_id: @user.id)
    @image_tag2 = FactoryBot.build(:image_tag, user_id: @user.id)
    sleep(1)
  end
  context 'カート機能' do
    it 'イラストをカートに入れる' do
      #ログインする
      sign_in(@user)
      #イラストを投稿する
      post_image(@image_tag)
      #投稿したイラストがブラウザに表示されていることを確認する
      Capybara.current_driver = :selenium
      expect(page).to have_selector("img[src$='test_image.png']")
      #画像をクリックしてイラスト詳細ページに遷移する
      click_on "picture"
      #カートに入れるボタンがあることを確認する
      expect(page).to have_content("カートに入れる")
      #カートに入れるボタンを押すとLine_itemsモデルのカウントが1上がることを確認する
      expect{click_on "カートに入れる"}.to change{LineItem.count}.by(1)
      #カートの中のページに遷移したことを確認する
      expect(page).to have_content("＜カートのなか＞")
      #先程カートに入れたイラストが表示されていることを確認する
      expect(page).to have_selector("img[src$='test_image.png']")
      Capybara.use_default_driver
    end
    it '未ログインのユーザーはカートに入れるボタンがない' do
      #ログインする
      sign_in(@user)
      #イラストを投稿する
      post_image(@image_tag)
      #ログアウトする
      Capybara.current_driver = :selenium
      find('.menu').click
      click_on "ログアウト"
      #投稿したイラストがブラウザに表示されていることを確認する
      expect(page).to have_selector("img[src$='test_image.png']")
      #画像をクリックしてイラスト詳細ページに遷移する
      click_on "picture"
      #カートに入れるボタンがないことを確認する
      expect(page).to have_no_content("カートに入れる")
      Capybara.use_default_driver
    end
    it 'カートに入ったイラストをあとから確認できる' do
      #ログインする
      sign_in(@user)
      #イラストを投稿する
      post_image(@image_tag)
      #投稿したイラストがブラウザに表示されていることを確認する
      Capybara.current_driver = :selenium
      expect(page).to have_selector("img[src$='test_image.png']")
      #カートを見るボタンがないことを確認する
      expect(page).to have_no_content("カートを見る")
      #画像をクリックしてイラスト詳細ページに遷移する
      click_on "picture"
      #カートに入れるボタンがあることを確認する
      expect(page).to have_content("カートに入れる")
      #カートに入れるボタンを押すとLine_itemsモデルのカウントが1上がることを確認する
      click_on "カートに入れる"
      #カートの中のページに遷移したことを確認する
      expect(page).to have_content("＜カートのなか＞")
      #先程カートに入れたイラストが表示されていることを確認する
      expect(page).to have_selector("img[src$='test_image.png']")
      #トップに戻るボタンを押す
      click_on "トップに戻る"
      #カートを見るボタンがあることを確認する
      expect(page).to have_content("カートを見る")
      #カートを見るボタンを押す
      click_on "icon-cart"
      #カートの中のページに遷移したことを確認する
      expect(page).to have_content("＜カートのなか＞")
      #先程カートに入れたイラストが表示されていることを確認する
      expect(page).to have_selector("img[src$='test_image.png']")
      Capybara.use_default_driver
    end
    it 'カートに入ったイラストを削除できる' do
      #ログインする
      sign_in(@user)
      #イラストを2つ投稿し、2つともカートに入れる
      Capybara.current_driver = :selenium
      add_cart_images(@image_tag,@image_tag2)
      expect(LineItem.count).to eq 2
      #カートを見るボタンでカートの中のページに遷移する
      click_on "icon-cart"
      #削除ボタンを押すと、Line_itemsモデルのカウントが2から1になることを確認する（1つ削除）
      expect{click_on "削除", match: :first}.to change{LineItem.count}.from(2).to(1)
      Capybara.use_default_driver
    end
    it 'カートを空にするを押すとカート内のイメージが全てなくなる' do
      #ログインする
      sign_in(@user)
      #イラストを2つ投稿し、2つともカートに入れる
      Capybara.current_driver = :selenium
      add_cart_images(@image_tag,@image_tag2)
      expect(LineItem.count).to eq 2
      #カートを見るボタンでカートの中のページに遷移する
      click_on "icon-cart"
      #カートを空にするボタンを押すと、LineItemモデルのカウントが0になる
      expect{click_on "カートを空にする"}.to change{LineItem.count}.from(2).to(0)
      #カートを見るボタンがないことを確認する
      expect(page).to have_no_content("カートを見る")
    end
  end
end