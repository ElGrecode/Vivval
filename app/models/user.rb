class User < ActiveRecord::Base
  include Tokenable
  has_secure_password

  has_many :blazons
  validates :first_name, :last_name, :email, :presence => true
  validates :password, length: { minimum: 6 }
  # For presentation purposes this line below is commented out
  #validates_uniqueness_of :email
end
