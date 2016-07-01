class Event < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :host, class_name: "User"
  has_many :guests
end
