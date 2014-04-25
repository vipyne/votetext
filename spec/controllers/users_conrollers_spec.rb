require 'spec_helper'

describe UsersController do

  describe "user creation page" do

    it "#create" do
      controller
      post :create
      expect(response).to be_redirect
    end

    it "#create" do
      controller
      expect {
        post :create, user: { id: 1, address_line1: "123 grand", city: "brooklyn", state: "ny", zip_code: "12345"}
      }.to change { User.count }.by(1)
    end

    it "#create" do
      expect {
        post :create, user: { address_line1: "123 grand", city: "brooklyn", state: "", zip_code: "12345"}
      }.to_not change { User.count }.by(1)
    end
  end

end
