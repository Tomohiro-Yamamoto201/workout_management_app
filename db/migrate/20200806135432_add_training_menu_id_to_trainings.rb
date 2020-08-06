class AddTrainingMenuIdToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_reference :trainings, :training_menu, null: false, foreign_key: true
  end
end
