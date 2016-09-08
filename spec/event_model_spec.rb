require_relative 'spec_helper'

describe Event do
	let(:event1) { Event.new }
  let(:event2) { Event.new(event_name: "Party", event_description: "party-time!", street: "633 Folsom Street", city: "San Francisco", state: "California", postcode: 94122, start_time: nil, end_time: nil, host_id: 2) }

  context "#Created" do
    it "has a name" do
      expect(event2.event_name).to eq("Party")
    end
    it "has a description" do
      expect(event2.event_description).to eq("party-time!") 
    end
    it "has an street" do
      expect(event2.street).to eq("633 Folsom Street")
    end
    it "has a city" do
      expect(event2.city).to eq("San Francisco")
    end
  end
end
