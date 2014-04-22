require 'spec_helper'

describe User do
  it { should validate_presence_of :address_line1 }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zip_code }

  describe "#initialize" do
    it "user model exists" do
      User.new.should be_an_instance_of User
    end
  end

end