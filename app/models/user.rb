class User < ActiveRecord::Base
  include Tokenable
  has_secure_password

  has_many :blazons

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

end
