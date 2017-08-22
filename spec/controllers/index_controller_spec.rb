require 'spec_helper'

describe "Index Controller" do
  context "get /" do
    it "loads homepage" do
      get '/'
      expect(last_response).to be_ok
    end
    it "returns status 200" do
      get '/'
      expect(last_response.status).to eq 200
    end
    it "displays the correct path" do
      get '/'
      expect(last_request.path).to eq('/')
    end
    it "displays homepage content" do
      get '/'
      expect(last_response.body).to include("Planning and organizing your events")
    end
  end
end
