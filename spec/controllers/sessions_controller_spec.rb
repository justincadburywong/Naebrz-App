require 'spec_helper'

describe "Sessions Controller" do
  context "get /sessions/new" do
    it "loads homepage" do
      get '/sessions/new'
      expect(last_response).to be_ok
    end
    it "returns status 200" do
      get '/sessions/new'
      expect(last_response.status).to eq 200
    end
    it "displays the correct path" do
      get '/sessions/new'
      expect(last_request.path).to eq('/sessions/new')
    end
    it "displays homepage content" do
      get '/sessions/new'
      expect(last_response.body).to include("Login")
    end
  end
end
