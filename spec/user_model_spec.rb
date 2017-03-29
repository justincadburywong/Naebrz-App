require_relative "spec_helper"

describe User do
  let(:user1) { User.new }
  let(:user2) { User.new(first_name: "john", last_name: "doe", email: "john_doe@dbc.com", password: "123") }
  let(:guest) { Guest.new(user_id: 1, event_id: 1) }
  let(:event) { Event.new(event_name: "Party", event_description: "party-time!", street: "633 Folsom Street", city: "San Francisco", state: "California", postcode: "94122", start_time: "2016-09-09 16:00:00 UTC", end_time: "2016-09-09 18:00:00 UTC", host_id: 1) }

  context "#Not Created" do
    it "does not have a first name" do
      expect(user1.first_name).to eq nil
    end
    it "does not have a last name" do
      expect(user1.last_name).to eq nil
    end
    it "does not have an email" do
      expect(user1.email).to eq nil
    end
    it "does not have a secure password" do
      expect(user1.password).to eq nil
    end
  end

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
