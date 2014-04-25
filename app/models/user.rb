# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

  attr_reader :password

  before_validation :ensure_session_token!

  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true


  # def self.generate_session_token
  #
  # end

  def reset_session_token!
    self.session_token = SecureRandom.hex
    self.save!
    session_token
  end

  def ensure_session_token!
    self.session_token ||= SecureRandom.hex
  end

  def self.find_by_credentials(creds)
    user = User.find_by_email(creds[:email])
    return user if user.try(:is_password?, creds[:password])
    nil
  end

  def password=(plaintext)
    @password = plaintext
    self.password_digest = BCrypt::Password.create(plaintext)
  end

  def is_password?(plaintext)
    BCrypt::Password.new(password_digest).is_password?(plaintext)
  end

end
