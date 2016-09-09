require_relative "spec_helper"

describe Event do
	let(:event1) { Event.new }
  let(:event2) { Event.new(event_name: "Party", event_description: "party-time!", street: "633 Folsom Street", city: "San Francisco", state: "California", postcode: 94122, start_time: "2016-09-09 16:09:08 UTC", end_time: "2016-09-09 18:09:08 UTC", host_id: 2) }

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
    	expect(event2.city).to eq("California")
    end
    it "has a start time" do
    	expect(event2.start_time).to eq("2016-09-09 16:09:08 UTC")
    end
    it "has an end time" do
    	expect(event2.end_time).to eq("2016-09-09 18:09:08 UTC")
    end
  end

  context "#Not Created" do
    it "does not have a name" do
      expect(event1.event_name).to eq nil
    end
    it "has a description" do
      expect(event1.event_description).to eq nil 
    end
    it "has an street" do
      expect(event1.street).to eq nil
    end
    it "has a city" do
      expect(event1.city).to eq nil
    end
    it "has a state" do
    	expect(event1.city).to eq nil
    end
    it "has a start time" do
    	expect(event1.start_time).to eq nil
    end
    it "has an end time" do
    	expect(event1.end_time).to eq nil
    end
  end
end
