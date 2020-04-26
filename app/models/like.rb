class Like < ApplicationRecord
    belongs_to :task,foreign_key: 'task_id'
    belongs_to :user,foreign_key: 'user_id'
    
end
