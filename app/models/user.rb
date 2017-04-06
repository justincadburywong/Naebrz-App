class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :events, foreign_key: :host_id

  include BCrypt
  has_secure_password
  before_save { self.email = email.downcase }

  validates :first_name, :last_name, :password, presence: true, allow_nil: false

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false },
                    presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/
  validates :phone, presence: true,
                    length: { maximum: 15 },
                    format: { with: VALID_PHONE_NUMBER_REGEX}

end
