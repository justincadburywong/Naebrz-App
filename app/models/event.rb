class Event < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :host, class_name: "User"
  has_many :guests

  validates :event_name, :event_description, :street, :city, :state, :postcode, :start_time, :end_time, :host_id, presence: true, allow_nil: false

end
