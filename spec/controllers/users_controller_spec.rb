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
  context "get /users/:id without a user" do
    it "redirects to login page if there is no current_user" do
      get '/users/7', :user => nil

      expect(last_response.redirect?).to be true
      follow_redirect!
      expect(last_request.path).to eq('/users/new')
    end
  end
  context "get /users/:id with a user" do
    let(:user){User.create(first_name: 'Justin', last_name: 'Wong', email: 'Justn@theinternet.com', password: 'password', phone: '4155559999')}
    it "displays user page if a current_user" do
      get "/users/#{user.id}", {}, { 'rack.session' => {:session => 1 }}

      expect(last_response.body).to include("Your Created Events")
    end
  end
end
