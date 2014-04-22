require 'spec_helper'

describe UsersController do

  describe "user creation page" do

    xit "#create" do
      controller
      post :create
      expect(response).to be_redirect
    end

    xit "#create" do
      controller
      expect {
        post :create, user: { name: "vip", phonenumber: "11234567890", address_line1: "123 grand", city: "brooklyn", state: "ny", zip_code: "12345"}
      }.to change { User.count }.by(1)
    end

    xit "#create" do
      expect {
        post :create, user: { name: "vip", phonenumber: "", address_line1: "123 grand", city: "brooklyn", state: "", zip_code: "12345"}
      }.to_not change { User.count }.by(1)
    end
  end

end
