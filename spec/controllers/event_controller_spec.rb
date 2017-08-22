require 'spec_helper'

describe "Events Controller" do
  context "get /events/new" do
    it "loads new event page" do
      get '/events/new'
      expect(last_response).to be_ok
    end
    it "returns status 200" do
      get '/events/new'
      expect(last_response.status).to eq 200
    end
    it "displays the correct path" do
      get '/events/new'
      expect(last_request.path).to eq('/events/new')
    end
    it "displays homepage content" do
      get '/events/new'
      expect(last_response.body).to include("Create a new event!")
    end
  end
end
