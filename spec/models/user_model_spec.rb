require_relative "../spec_helper"

describe User do
  let(:user1) { User.new }
  let(:user2) { User.new(first_name: "john", last_name: "doe", email: "john_doe@dbc.com", password: "123", phone: "415-555-0000") }

  context "Validations" do
    it "should not validate a saved user" do
      user1.valid?
    end
    it "should validate a saved user" do
      user2.valid?
    end
  end

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
    it "does not have a phone number" do
      expect(user1.phone).to eq nil
    end
    it "should not increase total entries in database when saved" do
      expect {
        user1.save
      }.not_to change(User, :count)
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
    it "has a phone number" do
      expect(user2.phone).to eq("415-555-0000")
    end
    it "should increase total entries in database when saved" do
      expect {
        user2.save
      }.to change(User, :count).by(1)
    end
  end

  context "#Updated" do
    it "has an updated first name" do
			user2.update(first_name: "James")
      expect(user2.first_name).to eq("James")
    end
    it "has an updated last name" do
			user2.update(last_name: "Dohe")
      expect(user2.last_name).to eq("Dohe")
    end
    it "has an updated password" do
			user2.update(password: "2nind0v2nd0vn0wn08")
      expect(user2.password).to eq("2nind0v2nd0vn0wn08")
    end
    it "has an updated phone" do
			user2.update(phone: "415-555-9900")
      expect(user2.phone).to eq("415-555-9900")
    end
    it "has an updated email" do
			user2.update(email: "james.dohe@theinternet.com")
    	expect(user2.email).to eq("james.dohe@theinternet.com")
    end
  end

  context "#Destroyed" do
    it "should reduce the total entries in the database" do
      user2.save
      expect {
        user2.destroy
      }.to change(User, :count).by(-1)
    end
    it "should remove event from the database" do
      user2.save
      user2.destroy
      expect(User.first).to eq(nil)
    end
  end
end
