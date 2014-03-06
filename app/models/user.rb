class User < ActiveRecord::Base
  attr_accessible :name, :phonenumber, :address_line1,
  :address_line2, :address_line3, :city, :state, :zip_code, :submit
  validates :address_line1, :city, :state, :zip_code, :presence => true

  def full_address
    "#{self.address_line1}, #{self.city}, #{self.state}, #{self.zip_code}"
  end

end