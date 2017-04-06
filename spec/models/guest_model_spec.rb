require_relative "../spec_helper"

describe Guest do
  let(:guest1) { Guest.new }
  let(:guest2) { Guest.new(user_id: 1, event_id: 1) }

  context "Validations" do
    it "should not validate a saved guest" do
      guest1.valid?
    end
    it "should validate a saved guest" do
      guest2.valid?
    end
  end

  context "#Not Created" do
    it "does not have a user ID" do
      expect(guest1.user_id).to eq nil
    end
    it "does not have an event ID" do
      expect(guest1.event_id).to eq nil
    end
    it "should not save when users are not present" do
      expect {
        guest1.save
      }.not_to change(Guest, :count)
    end
  end

  context "#Created" do
    it "has a user ID" do
      expect(guest2.user_id).to eq(1)
    end
    it "has an event ID" do
      expect(guest2.event_id).to eq(1)
    end
    it "should save correctly when valid" do
      expect {
        guest2.save
      }.to change(Guest, :count).by(1)
    end
  end

  context "#Destroy" do
    it "should reduce the total entries in the database" do
      guest2.save
      expect {
        guest2.destroy
      }.to change(Guest, :count).by(-1)
    end
    it "should remove guest from the database" do
      guest2.save
      guest2.destroy
      expect(Guest.first).to eq(nil)
    end
  end

end
