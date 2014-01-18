require 'spec_helper'

describe UsersController do

  describe "user creation page" do

    it "#create" do
      controller
      post :create
      expect(response).to be_redirect
    end

    xit "#create" do
      controller
      expect {
        post :create
      }.to change { User.count }.by(1)
    end

    xit "#create" do
      expect {
        post :create, user: { uid: "a", access_token: 123, nickname: ""}
      }.to_not change { User.count }.by(1)
    end
  end

end
