class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :follower_id, null: false, index: true, foreign_key: { to_table: :users }
      t.references :followed_id, null: false, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
