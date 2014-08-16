class TemporaryUser < ActiveRecord::Base
  include Tokenable
  # This model is going to do somethings
  # First it's going to validate that the email is in fact an acceptable email
  # If it is, it's then going to check if 
  validates_presence_of :email
end
