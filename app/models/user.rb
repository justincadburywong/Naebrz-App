class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt
  has_secure_password
  has_many :events, foreign_key: :host_id
  has_many :guests, foreign_key: :user_id
  validates :email, uniqueness: true
end
