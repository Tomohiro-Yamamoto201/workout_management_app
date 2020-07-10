class TrainingMenu < ApplicationRecord
    belongs_to :user
    has_many :training
end
