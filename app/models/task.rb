class Task < ApplicationRecord
    has_many :likes,foreign_key: 'task_id', dependent: :destroy
    belongs_to :user,foreign_key: 'user_id'
    
end
