require_relative "spec_helper"

describe User do
  let(:user1) { User.new }
  let(:user2) { User.new(first_name: "john", last_name: "doe", email: "john_doe@dbc.com", password: "123") }
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

end