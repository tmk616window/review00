class Chat < ApplicationRecord
  belongs_to :channel, optional: true
  belongs_to :user, optional: true
end
