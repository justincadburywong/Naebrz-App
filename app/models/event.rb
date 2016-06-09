class Event < ActiveRecord::Base
  # Remember to create a migration!
  has_many :users
  belongs_to :users, foreign_key: :host_id
end
