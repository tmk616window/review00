class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :tasks, foreign_key: 'user_id', dependent: :destroy
    has_many :likes, foreign_key: 'user_id', dependent: :destroy
    has_many :messages, foreign_key: 'user_id', dependent: :destroy
    mount_uploader :icon, ImageUploader

    has_many :chats
end
