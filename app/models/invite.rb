class Invite < ApplicationRecord
  belongs_to :guest_id, class_name: "User"
  belongs_to :game
end
