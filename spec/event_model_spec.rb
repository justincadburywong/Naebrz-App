require 'spec_helper'

describe Event do
	let(:event1) { Event.new }
  let(:event2) { Event.new(event_name: "Party", event_description: "party-time!", street: "633 Folsom Street", city: "San Francisco", state: "California", postcode: 94122, start_time: , end_time: , host_id: 2) }

  context "#Created" do
    it "has a first name" do
      expect(user2.first_name).to eq("john")
    end
    it "has a last name" do
      expect(user2.last_name).to eq("doe") 
    end
    it "has an email" do
      expect(user2.email).to eq("john_doe@dbc.com")
    end
    it "has a secure password" do
      expect(user2.password).to eq("123")
    end
  end
end
