class User < ApplicationRecord
  has_many :entries

  def authenticate(plain_text_password)
    BCrypt::Password.new(self["password"]) == plain_text_password
  end
end