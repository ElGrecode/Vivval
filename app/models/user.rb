class User < ActiveRecord::Base
  include Tokenable
  has_secure_password

  has_many :blazons
  validates :first_name, :last_name, :presence => true
end
