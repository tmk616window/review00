class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user,foreign_key: 'user_id'

    validates :name, presence: true
    validates :date, presence: true
    validates :content, presence: true
    validates :message_coment, presence: true
    validates :message_place, presence: true
    validates :people, presence: true
    validates :user_id, presence: true
end
