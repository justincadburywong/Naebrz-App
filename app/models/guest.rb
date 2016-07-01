class Guest < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :event
  belongs_to :user
end
