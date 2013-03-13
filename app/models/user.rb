require 'BCrypt'
class User < ActiveRecord::Base
  has_one :token
  # Remember to create a migration!

  # def password
  #     @password ||= Password.new(password_hash)
  # end

  #   def password=(new_password)
  #     @password = Password.create(new_password)
  #     self.password_hash = @password
  #   end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    user && (BCrypt::Password.new(user.password_hash) == password)
  end

end
