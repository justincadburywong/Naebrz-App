class Guest < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :event
  belongs_to :user
  validates :user_id, presence: true, allow_nil: false
  validates :event_id, presence: true, allow_nil: false
end
