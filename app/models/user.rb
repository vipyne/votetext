class User < ActiveRecord::Base
  attr_accessible :name, :phonenumber, :address_line1,
:address_line2, :address_line3, :city, :state, :zip_code
  validates :phonenumber, :address_line1, :city, :state, :zip_code, :presence => true


end