class User < ActiveRecord::Base
  attr_accessible :name, :phonenumber, :address_line1,
  :address_line2, :address_line3, :city, :state, :zip_code, :submit
  # validates :address_line1, :city, :state, :zip_code, :presence => true

  def full_address
    "#{self.address_line1}, #{self.city}, #{self.state}, #{self.zip_code}"
  end

  def twilio_phonenumber user
    user_number = user.phonenumber
    ten_numbers = []
    numbers = user_number.each_char do |char|
      num = char[/\d/]
      ten_numbers << num
    end
    ten_numbers.compact!
    if user_number[0] == "1"
      number = []
      ten_numbers = ten_numbers[0,11]
    else
      number = [1]
      ten_numbers = ten_numbers[0,10]
    end
    number << ten_numbers
    number.join
  end

end