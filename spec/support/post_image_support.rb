module PostImage
  def post_image(image)
    visit new_image_path
    picture_path = Rails.root.join('public/images/test_image.png')
    attach_file('image_tag[picture]', picture_path, make_visible: true)
    fill_in "投稿者コメント", with: image.comment
    select "1月",from: 'image_tag[season_id]'
    fill_in "タグ", with: image.name
    find('input[name="commit"]').click
  end
  def add_cart_images(image1,image2)
    visit new_image_path
    picture_path = Rails.root.join('public/images/test_image.png')
    attach_file('image_tag[picture]', picture_path, make_visible: true)
    fill_in "投稿者コメント", with: image1.comment
    select "1月",from: 'image_tag[season_id]'
    fill_in "タグ", with: image1.name
    find('input[name="commit"]').click
    click_on "picture"
    click_on "カートに入れる"
    click_on "トップに戻る"

    visit new_image_path
    picture_path = Rails.root.join('public/images/test2_image.png')
    attach_file('image_tag[picture]', picture_path, make_visible: true)
    fill_in "投稿者コメント", with: @image_tag2.comment
    select "2月",from: 'image_tag[season_id]'
    fill_in "タグ", with: @image_tag2.name
    find('input[name="commit"]').click
    click_on "picture", match: :first
    click_on "カートに入れる"
    click_on "トップに戻る"
  end
end
