class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
# class << self
#   def authenticate(mobile, otp)
#     account = Account.find_for_authentication(mobile: mobile)
#     user.try(:valid_otp?, otp) ? account : nil
#   end
# end
   has_many :boards
  validates_presence_of :student_name, :mobile, :email, :dob, :otp
end

