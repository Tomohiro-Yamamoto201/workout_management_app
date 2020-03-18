class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :email, null: false, unique: true
      t.integer  :gender,  null: false
      t.integer  :height,  null: false
      t.integer  :body_weight,  null: false
      t.date :born_on
      t.timestamps
    end
  end
end
