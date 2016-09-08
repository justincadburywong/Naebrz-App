require_relative "../models/user"

describe Users do
  let(:user1) { User.new }
  let(:user2) { User.new(first_name: "john", last_name: "doe", email: "john_doe@dbc.com", password: "123") }

  describe "#User Attributes" do
    it "has a first name" do
      expect(user1.first_name).to eq "john"
    end
  end

  # describe "#height" do
  #   it "has a height" do
  #     expect(tree.height).to eq 0
  #   end
  # end

  # describe "#pass_growing_season" do
  #   it "should change the age" do
  #     # This should be more explicit. How much should the tree age by?
  #     # https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/expect-change
  #     expect {tree.pass_growing_season}.to change {tree.age}
  #   end

  #   it "should make the tree grow" do
  #     #This should be more explicit. How much should the tree grow?
  #     expect {tree.pass_growing_season}.to change{tree.height}
  #   end

  #   context "the tree is old enough to bear fruit" do
  #     it "should cause the tree to produce oranges" do
  #       expect(tree.mature?).to eq false
  #       expect(tree2.mature?).to eq true
  #     end
  #   end
  # end

  # describe "#mature?" do
  #   it "returns true if tree is old enough to bear fruit" do
  #     expect(tree2.mature?).to eq true
  #   end

  #   it "returns false if tree is not old enough to bear fruit" do
  #      expect(tree.mature?).to eq false
  #   end
  # end

  # describe "#dead?" do
  #   it "should return false for an alive tree" do
  #     expect(tree.dead?).to eq false
  #   end

  #   it "should return true for a dead tree" do
  #     expect(tree3.dead?).to eq true
  #   end
  # end

  # describe '#has_fruit?' do
  #   it 'should return true if apples are on the tree' do
  #     3.times {tree2.pass_growing_season}
  #     expect(tree2.has_fruit?).to eq true
  #   end

  #   it "should return false if the tree has no apples" do
  #     expect(tree.has_fruit?).to eq false
  #   end
  # end

  # describe "#pick_a_piee" do
  #   it "should return an apple from the tree" do
  #     3.times {tree2.pass_growing_season}
  #     expect(tree2.pick_a_piece).to be_instance_of(Apple)
  #   end

  #   it "the returned apple should no longer be on the tree" do
  #     3.times {tree2.pass_growing_season}
  #     apple1 = tree2.pick_a_piece
  #     expect(tree2.fruit).not_to include(apple1)
  #   end

  #   it "should raise an error if the tree has no apples" do
  #   expect {tree2.pick_a_piece}.to raise_error StandardError
  #   end
  # end
end