class Training < ApplicationRecord
    belongs_to :training_menu, optional: true
    belongs_to :user, optional: true



end
