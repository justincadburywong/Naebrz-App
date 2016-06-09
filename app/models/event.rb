class Event < ActiveRecord::Base
  # Remember to create a migration!
  has_many :users
  belongs_to :host, class_name: "User"
end
