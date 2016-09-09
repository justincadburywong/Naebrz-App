require_relative 'spec_helper'

describe Event do
	let(:event1) { Event.new }
  let(:event2) { Event.new(event_name: "Party", event_description: "party-time!", street: "633 Folsom Street", city: "San Francisco", state: "California", postcode: 94122, start_time: "2016-09-09 16:00:00 UTC", end_time: "2016-09-09 18:00:00 UTC", host_id: 2) }

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
    it "has a state" do
    	expect(event2.state).to eq("California")
    end
    it "has a postcode" do
    	expect(event2.postcode).to eq 94122
    end
    it "has a start time" do
    	expect(event2.start_time).to eq("2016-09-09 16:00:00 UTC")
    end
    it "has an end time" do
    	expect(event2.end_time).to eq("2016-09-09 18:00:00 UTC")
    end
    it "has a host" do
    	expect(event2.host_id).to eq 2
    end
  end
end
