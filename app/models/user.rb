class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :events, foreign_key: :host_id
end
