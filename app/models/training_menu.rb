class TrainingMenu < ApplicationRecord

    belongs_to :user, optional: true
    has_many :trainings, dependent: :destroy

    

end
