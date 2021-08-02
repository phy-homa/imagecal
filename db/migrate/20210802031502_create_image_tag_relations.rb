class CreateImageTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :image_tag_relations do |t|
      t.references :image, foreign_key: true
      t.references :tag,  foreign_key: true
      t.timestamps
    end
  end
end
