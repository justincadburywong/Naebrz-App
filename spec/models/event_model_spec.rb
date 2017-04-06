require_relative '../spec_helper'

describe Event do
	let(:event1) { Event.new }
  let(:event2) { Event.new(event_name: "Party", event_description: "party-time!", street: "633 Folsom Street", city: "San Francisco", state: "California", postcode: "94122", start_time: "2016-09-09 16:00:00 UTC", end_time: "2016-09-09 18:00:00 UTC", host_id: 1) }

	context "Validations" do
    it "should not validate a saved event" do
      event1.valid?
    end
    it "should validate a saved event" do
      event2.valid?
    end
  end

  context "#Not Created" do
  	it "does not have a name" do
  		expect(event1.event_name).to eq nil
  	end
 		it "does not have a description" do
      expect(event1.event_description).to eq nil
    end
    it "does not have an street" do
      expect(event1.street).to eq nil
    end
    it "does not have a city" do
      expect(event1.city).to eq nil
    end
    it "does not have a state" do
    	expect(event1.state).to eq nil
    end
    it "does not have a postcode" do
    	expect(event1.postcode).to eq nil
    end
    it "does not have a start time" do
    	expect(event1.start_time).to eq nil
    end
    it "does not have an end time" do
    	expect(event1.end_time).to eq nil
    end
    it "does not have a host" do
    	expect(event1.host_id).to eq nil
    end
		it "should not increase total entries in database when saved" do
			expect {
				event1.save
			}.not_to change(Event, :count)
		end
  end

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
    	expect(event2.postcode).to eq("94122")
    end
    it "has a start time" do
    	expect(event2.start_time).to eq("2016-09-09 16:00:00 UTC")
    end
    it "has an end time" do
    	expect(event2.end_time).to eq("2016-09-09 18:00:00 UTC")
    end
    it "has a host" do
    	expect(event2.host_id).to eq 1
    end
		it "should increase total entries in database when saved" do
			expect {
				event2.save
			}.to change(Event, :count).by(1)
		end
  end

  context "#Updated" do
    it "has an updated name" do
			event2.update(event_name: "Partee")
      expect(event2.event_name).to eq("Partee")
    end
    it "has an updated description" do
			event2.update(event_description: "Partee time!")
      expect(event2.event_description).to eq("Partee time!")
    end
    it "has an updated street" do
			event2.update(street: "44 Montgomery")
      expect(event2.street).to eq("44 Montgomery")
    end
    it "has an updated city" do
			event2.update(city: "Saint Francis")
      expect(event2.city).to eq("Saint Francis")
    end
    it "has an updated state" do
			event2.update(state: "Kalifornia")
    	expect(event2.state).to eq("Kalifornia")
    end
    it "has an updated postcode" do
			event2.update(postcode: "94124")
    	expect(event2.postcode).to eq("94124")
    end
    it "has an updated start time" do
			event2.update(start_time: "2016-09-09 17:00:00 UTC")
    	expect(event2.start_time).to eq("2016-09-09 17:00:00 UTC")
    end
    it "has an updated end time" do
			event2.update(end_time: "2016-09-09 19:00:00 UTC")
    	expect(event2.end_time).to eq("2016-09-09 19:00:00 UTC")
    end
  end

	context "#Destroyed" do
		it "should reduce the total entries in the database" do
      event2.save
      expect {
        event2.destroy
      }.to change(Event, :count).by(-1)
    end
    it "should remove event from the database" do
      event2.save
      event2.destroy
      expect(Event.first).to eq(nil)
    end
	end
end
