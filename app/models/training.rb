class Training < ApplicationRecord
    validates :start_time, presence:true

    belongs_to :training_menu, optional: true
    belongs_to :user, optional: true
    
    

end
