class AddIntroduceToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :introduce, :text
  end
end
