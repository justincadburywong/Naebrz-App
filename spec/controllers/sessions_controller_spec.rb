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

  context "post /sessions" do
    # before(:each) do
    # @admin = User.create(email: "tim@tim.com", password: "timtim", admin: true)
    # session[:user_id] = @admin.id
    #
    #
    # it 'responds with an ok status'
    # # get :new
    # # expect(response.status).to eq 200
    #
    #
    # it 'renders the correct view'
    # # session[:user_id] = @admin.id
    # # get :new
    # # expect(response).to have_rendered(:new)
    #
    #
    # it 'redirects to login if not logged in'
    # # get :new, params: { }, session: { user_id: nil }
    # # expect(response).to redirect_to new_user_session_path
    #
    #
    # end
  end
end
