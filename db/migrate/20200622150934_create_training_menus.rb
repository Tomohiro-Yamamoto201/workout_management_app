class CreateTrainingMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :training_menus do |t|
      t.string :training_menu
      t.datetime :published_at
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
