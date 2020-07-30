class AddStartTimeToTrainingMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :training_menus, :start_time, :datetime
  end
end
