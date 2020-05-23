class Task < ApplicationRecord
    has_many :likes,foreign_key: 'task_id', dependent: :destroy
    belongs_to :user,foreign_key: 'user_id'

    validates :design_point, presence: true
    validates :function_point, presence: true 
    validates :plam_point, presence: true
    validates :unique_point, presence: true
    validates :user_perspective_point, presence: true
    validates :recruit, presence: true
    validates :field, presence: true
    validates :task_pl, presence: true
    validates :task_tool, presence: true
    validates :github_url, presence: true
    validates :company_info, presence: true
    validates :task_coment, presence: true
    validates :user_id, presence: true
    validates :study_period, presence: true
end
