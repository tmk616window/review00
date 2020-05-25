class Channel < ApplicationRecord
  has_many :chats, dependent: :destroy
  
  validates :user_id, presence: true
  validates :task_id, presence: true
end
