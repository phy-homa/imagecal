module PostImage
  def post_image(image)
    visit new_image_path
    picture_path = Rails.root.join('public/images/test_image.png')
    attach_file('image_tag[picture]', picture_path, make_visible: true)
    fill_in "投稿者コメント", with: @image_tag.comment
    select "1月",from: 'image_tag[season_id]'
    fill_in "タグ", with: @image_tag.name
    find('input[name="commit"]').click
  end
end
