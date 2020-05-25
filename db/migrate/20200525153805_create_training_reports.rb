class CreateTrainingReports < ActiveRecord::Migration[6.0]
  def change
    create_table :training_reports do |t|
      t.text :content, null: false
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps
    end
    add_index :training_reports, [:user_id, :created_at]
  end
end
