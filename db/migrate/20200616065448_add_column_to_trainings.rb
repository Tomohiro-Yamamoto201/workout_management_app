class AddColumnToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :growing_parts, :string, null: false
  end
end
