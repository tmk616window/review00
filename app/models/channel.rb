class Channel < ApplicationRecord
  has_many :chats, dependent: :destroy
end
