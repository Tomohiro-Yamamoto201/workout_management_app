class TrainingMenu < ApplicationRecord
    belongs_to :user
    has_many :trainings

    validates :training_menu, uniqueness: true

end
