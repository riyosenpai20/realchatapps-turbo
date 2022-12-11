class Message < ApplicationRecord
  belongs_to :room
  has_many :messages

  after_create_commit { broadcast_append_to "rooms" }
end
