class AddUserIdToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_reference :trainings, :user, null: false, index: true, foreign_key: true
  end
end
