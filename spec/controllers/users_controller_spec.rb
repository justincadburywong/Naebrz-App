require 'spec_helper'

describe "Users Controller" do
  context "get /users/new" do
    it "loads homepage" do
      get '/users/new'
      expect(last_response).to be_ok
    end
    it "returns status 200" do
      get '/users/new'
      expect(last_response.status).to eq 200
    end
    it "displays the correct path" do
      get '/users/new'
      expect(last_request.path).to eq('/users/new')
    end
    it "displays homepage content" do
      get '/users/new'
      expect(last_response.body).to include("Register for Naebrz")
    end
  end
end
