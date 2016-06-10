class Gathering < ActiveRecord::Base
  # Remember to create a migration!
  has_many :guests
  belongs_to :hosts
end
